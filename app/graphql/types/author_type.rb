module Types
  class AuthorType < Types::BaseObject
    field :full_name, String, null: true
    # field :source_works, [types::SourceContentType], null: true
    field :occupation, String, null: true
    field :education, String, null: true
    field :birth_date, Int, null: true
  end
end
