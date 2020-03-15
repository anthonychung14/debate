module Types
  class SourceContentType < Types::BaseObject
    field :author, [Types::AuthorType], null: false
    field :content_category, Types::ContentCategory, null: true
    field :link, String, null: true
    field :publisher, String, null: true
    field :publish_date, Bignum, null: true
    field :subtitle, String, null: false
    field :title, String, null: true
  end
end
