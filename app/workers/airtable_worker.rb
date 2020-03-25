class AirtableWorker
  include Sidekiq::Worker

  def perform()
    puts "STARTING WORK <============>"
    puts "Done with work"
  end
end
