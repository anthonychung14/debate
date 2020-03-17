module Types
  class ExcerptType < Types::BaseObject
    field :content, SourceContentType, null: false
    field :start_position, Int, null: false
    field :end_position, Int, null: false
  end
end
