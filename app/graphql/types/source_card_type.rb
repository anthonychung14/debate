module Types
  class SourceCardType < Types::BaseObject
    field :header, String, null: false
    field :gif_url, String, null: false
    field :subheader, String, null: true
    field :source_content, Types::SourceContentType, null: false
    field :warrant, String, null: false
  end
end
