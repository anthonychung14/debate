# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

# Player One
Creator.create(name: "Anthony Chung", email: "anthonychung14@gmail.com")
# AirtableWorker.perform_async()
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
    airtable_key: item[:id],
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

@excerpts = @client.table("appO4vBVgVx66KFPX", "excerpt")
records = @excerpts.all

records.each do |item|
  source_id = item[:source_id]
  source_content = SourceContent.find_by(:airtable_key => source_id)

  if !source_content.nil?
    excerpt = Excerpt.create!({
      airtable_key: item[:id],
      content_medium: item[:content_medium],
      gif_url: item[:gif_url],
      giphy_id: item[:giphy_id],
      link: item[:link],
      source_content_id: source_content[:id],
      text_content: item[:content],
    })
  end
end
