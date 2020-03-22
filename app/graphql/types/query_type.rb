module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.
    def all_content_makers(filters: nil)
      res = ContentMaker.all.order(full_name: :desc)
      res
      # if filters.nil?
      #   res
      # else
      # filters.any? ? res.joins(:content_sources).where({ content_medium: filters }) : res
      # end
    end

    def all_creators
      Creator.all
    end

    def all_excerpts
      Excerpt.all
    end

    def all_source_contents(filters: nil)
      res = SourceContent.all
      # filters.any? ? res.where({ content_category: filters }) : res
      res
    end

    def source_contents_for_content_maker(content_maker_id:)
      contentMaker = ContentMaker.find(content_maker_id)
      contentMaker.source_contents
    end

    def excerpts_for_source_content(source_content_id:)
      Excerpt.where(source_content_id: source_content_id)
    end

    field :all_content_makers, [ContentMakerType], null: false do
      argument :filters, [ContentMedium], required: false
    end

    field :all_creators, [CreatorType], null: false
    field :all_source_contents, [SourceContentType], null: false do
      argument :filters, [ContentCategory], required: false
    end

    field :all_excerpts, [ExcerptType], null: false

    field :source_contents_for_content_maker, [SourceContentType], null: false, description: "returns a collection of content given an author's id" do
      argument :content_maker_id, ID, required: true
    end

    field :excerpts_for_source_content, [ExcerptType], null: false, description: "returns a collection of excerpts given a content source's id" do
      argument :source_content_id, ID, required: true
    end
  end
end
