module Types
  class MutationType < BaseObject
    field :create_author, mutation: Mutations::CreateAuthor
    field :create_creator, mutation: Mutations::CreateCreator
    field :create_source_content, mutation: Mutations::CreateSourceContent
    field :create_authors_source_content_work, mutation: Mutations::CreateAuthorsSourceContentWork
  end
end
