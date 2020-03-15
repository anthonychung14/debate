module Types
  class BaseObject < GraphQL::Schema::Object
    field :id, ID, null: false
    field_class Types::BaseField
  end
end
