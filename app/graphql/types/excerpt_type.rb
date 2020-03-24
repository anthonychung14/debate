module Types
  class ExcerptType < Types::BaseObject
    field :start_position, Int, null: false
    field :end_position, Int, null: false
    field :link, String, null: true
    field :title, String, null: true
    field :gif_url, String, null: true
    field :content_medium, ContentMedium, null: true
    field :text_content, String, null: true
  end
end
