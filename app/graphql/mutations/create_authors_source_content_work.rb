module Mutations
  class CreateAuthorsSourceContentWork < BaseMutation
    # arguments passed to the `resolve` method
    argument :author_id, ID, required: true
    argument :source_content_id, ID, required: true

    field :title, String, null: false
    field :author, Types::ContentCategory, null: false

    def resolve(author_id: nil, source_content_id: nil)
      AuthorsSourceContentWorks.create!(
        author_id: author_id,
        source_content_id: source_content_id,
      )
    end
  end
end
