module Mutations
  class CreateSourceCard < BaseMutation
    # arguments passed to the `resolve` method
    argument :excerpt_id, ID, required: true
    argument :header, String, required: true
    argument :warrant, String, required: true
    argument :subheader, String, required: false

    # return type from the mutation
    type Types::SourceCard

    def resolve(excerpt_id: nil, header: nil, warrant: nil, subheader: nil)
      SourceCard.create!(
        source_excerpt_id: excerpt_id,
        header: header,
        warrant: warrant,
        subheader: subheader,
      )

      puts "<< ++++++++++++++++++ >>"
    end
  end
end
