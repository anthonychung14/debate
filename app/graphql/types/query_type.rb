module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    def all_authors
      Author.all
    end

    def all_creators
      Creator.all
    end

    def all_source_contents
      SourceContent.all
    end

    field :all_authors, [AuthorType], null: false
    field :all_creators, [CreatorType], null: false
    field :all_source_contents, [SourceContentType], null: false
  end
end
