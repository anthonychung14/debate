class SourceWorker
  include Sidekiq::Worker

  def perform()
    puts "STARTING WORK <============>"
    @client = Airtable::Client.new("keyXl84W0rtRUuOEV")
    @table = @client.table("appO4vBVgVx66KFPX", "textSource")

    records = @table.all

    records.each do |item|
      author_ids = item[:author_id]

      new_source = SourceContent.create!({
        link: item[:link],
        subtitle: item[:subtitle],
        content_category: item[:content_category],
        content_medium: item[:content_medium],
        synopsis: item[:synopsis],
        gif_url: item[:gif_url],
        giphy_id: item[:giphy_id],
      })

      #   updated_source = SourceContent.find_by(link: item[:link])
      # take the id and append to Author's source_content_ids
      authors = Author.where(airtable_key: author_ids)

      authors.each { |a| a.update_all source_content_ids: a[:source_content_ids].push(new_source[:id]) }
    end

    puts "Done with work"
  end
end
