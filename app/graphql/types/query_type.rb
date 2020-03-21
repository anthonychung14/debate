module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.
    def all_content_makers
      ContentMaker.all.order(:full_name)
    end

    def all_creators
      Creator.all
    end

    def all_excerpts
      Excerpt.all
    end

    def all_source_contents
      SourceContent.all
    end

    def source_contents_for_content_maker(content_maker_id:)
      contentMaker = ContentMaker.find(content_maker_id)
      contentMaker.source_contents
    end

    def excerpts_for_content(source_content_id:)
      Excerpt.where(source_content_id: source_content_id)
    end

    field :all_content_makers, [ContentMakerType], null: false
    field :all_creators, [CreatorType], null: false
    field :all_source_contents, [SourceContentType], null: false
    field :all_excerpts, [ExcerptType], null: false

    field :source_contents_for_content_maker, [SourceContentType], null: false, description: "returns a collection of content given an author's id" do
      argument :content_maker_id, ID, required: true
    end

    field :excerpts_for_content, [ExcerptType], null: false, description: "returns a collection of excerpts given a content source's id" do
      argument :source_content_id, ID, required: true
    end
  end
end
