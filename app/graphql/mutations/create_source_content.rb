module Mutations
  class CreateSourceContent < BaseMutation
    # arguments passed to the `resolve` method
    # argument :content_category, Types::ContentCategory, required: true
    argument :link, String, required: false
    argument :author_id, ID, required: false

    # field :content_category, Types::ContentCategory, null: false
    field :link, String, null: false

    def resolve(link: nil, author_id: nil)
      SourceContent.create!(
        link: link,
        author_id: author_id,
      )
    end
  end
end
