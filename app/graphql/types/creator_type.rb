module Types
  class CreatorType < Types::BaseObject
    field :email, String, null: true
    field :source_cards, [Types::SourceCardType], null: true
  end
end
