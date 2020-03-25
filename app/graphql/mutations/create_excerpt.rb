module Mutations
  class CreateExcerpt < BaseMutation
    # arguments passed to the `resolve` method
    argument :content_id, ID, required: true
    argument :start_position, Int, required: true
    argument :end_position, Int, required: true
    argument :gif_url, String, required: true

    # return type from the mutation
    # type Types::AuthorType
    field :id, ID, null: false
    field :source_content_id, ID, null: false
    field :start_position, Int, null: false
    field :end_position, Int, null: false
    field :gif_url, String, null: false

    def resolve(content_id: nil, start_position: nil, end_position: nil, gif_url: nil)
      e = Excerpt.create!(
        source_content_id: content_id,
        start_position: start_position,
        end_position: end_position,
        gif_url: gif_url,
      )

      url = SourceContent.find(content_id)

      puts "<< ++++++++++++++++++ >>"
      response = Net::HTTP.post_form(URI.parse("https://snaker-scraper.herokuapp.com/process_audio"), { url: url[:link], start_position: start_position, end_position: end_position, excerpt_id: e[:id] })
      puts "<< POSTED TO PYTHON >>"
      return e
    end
  end
end
