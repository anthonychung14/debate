class SourceWorker
  include Sidekiq::Worker

  def perform()
    puts "STARTING WORK <============>"
    @client = Airtable::Client.new("keyXl84W0rtRUuOEV")
    @table = @client.table("appO4vBVgVx66KFPX", "textSource")

    records = @table.all

    records.each do |item|
      author_ids = item[:author_id]
      authors = Author.where(:airtable_key => author_ids)

      content = SourceContent.create!({
        content_category: item[:content_category],
        content_medium: item[:content_medium],
        gif_url: item[:gif_url],
        giphy_id: item[:giphy_id],
        link: item[:link],
        series_name: item[:series_name],
        subtitle: item[:subtitle],
        synopsis: item[:synopsis],
        title: item[:title],
      })

      if !authors.first.nil?
        SourceContent.update(content[:id], :author_id => authors.first[:id])
      end
    end
  end
end
