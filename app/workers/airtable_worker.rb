class AirtableWorker
  include Sidekiq::Worker

  def perform()
    puts "STARTING WORK <============>"
    @client = Airtable::Client.new("keyXl84W0rtRUuOEV")
    @table = @client.table("appO4vBVgVx66KFPX", "author")
    @filtered = @table.all

    authors = @filtered.select do |item|
      item[:char_type] == "person"
    end

    authors.each do |item|
      Author.create!({
        full_name: item[:name],
        airtable_key: item[:id],
        notes: item[:notes],
        address: item[:address],
        city: item[:city],
        zipcode: item[:zipcode],
        airtable_key: item[:id],
      })
    end

    puts "Done with work"
  end
end
