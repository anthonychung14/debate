class AirtableWorker
  include Sidekiq::Worker

  def perform()
    puts "STARTING WORK <============>"
    @client = Airtable::Client.new("keyXl84W0rtRUuOEV")
    @table = @client.table("appO4vBVgVx66KFPX", "author")
    @filtered = @table.all

    @filtered.each do |item|
      ContentMaker.create!({
        full_name: item[:name],
        airtable_key: item[:id],
        notes: item[:notes],
        address: item[:address],
        city: item[:city],
        zipcode: item[:zipcode],
      })
    end

    @textSourceTable = @client.table("appO4vBVgVx66KFPX", "textSource")
    records = @textSourceTable.all

    records.each do |item|
      author_ids = item[:author_id]
      content_makers = ContentMaker.where(:airtable_key => author_ids)

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
        content_makers: content_makers,
      })
    end

    puts "Done with work"
  end
end
