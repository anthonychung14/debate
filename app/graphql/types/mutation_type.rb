module Types
  class MutationType < BaseObject
    field :create_author, mutation: Mutations::CreateAuthor
    field :create_creator, mutation: Mutations::CreateCreator
    field :create_excerpt, mutation: Mutations::CreateExcerpt
    field :create_source_content, mutation: Mutations::CreateSourceContent
    field :create_source_card, mutation: Mutations::CreateSourceCard
    field :create_authors_source_content_work, mutation: Mutations::CreateAuthorsSourceContentWork
    field :update_excerpt, mutation: Mutations::UpdateExcerpt
  end
end
