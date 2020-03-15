module Mutations
  class CreateSourceContent < BaseMutation
    # arguments passed to the `resolve` method
    argument :content_category, Types::ContentCategory, required: true
    argument :link, String, required: false
    argument :subtitle, String, required: false
    argument :title, String, required: true
    argument :publish_date, Bignum, required: true

    field :title, String, null: false
    field :content_category, Types::ContentCategory, null: false

    def resolve(title: nil, link: nil, content_category: nil, subtitle: nil, publish_date: nil)
      SourceContent.create!(
        title: title,
        subtitle: subtitle,
        content_category: content_category,
        link: link,
        publish_date: publish_date,
      )
    end
  end
end
