module Types
  class SourceCardType < Types::BaseObject
    field :header, String, null: false
    field :subheader, String, null: true
    field :source_content, Types::SourceContentType, null: false
    field :excerpt_data, Types::ExcerptType, null: false
    field :warrant, String, null: false
  end
end
