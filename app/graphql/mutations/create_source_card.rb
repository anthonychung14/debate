module Mutations
  class CreateSourceCard < BaseMutation
    # arguments passed to the `resolve` method
    argument :excerpt_id, ID, required: true
    argument :header, String, required: true
    argument :warrant, String, required: true
    argument :gif_url, String, required: true
    argument :subheader, String, required: false

    # return type from the mutation
    type Types::SourceCardType

    def resolve(excerpt_id: nil, header: nil, warrant: nil, subheader: nil, gif_url: nil)
      e = Excerpt.find_by(id: excerpt_id)
      # c = SourceContent.find_by(id: e.source_content_id)

      SourceCard.create!(
        excerpt_id: excerpt_id,
        header: header,
        warrant: warrant,
        subheader: subheader,
        gif_url: gif_url,
        creator_id: 1,
      )

      puts "<< ++++++++++++++++++ CREATED SOURCE CARD +++++++++++++++++++++ >>"
    end
  end
end
