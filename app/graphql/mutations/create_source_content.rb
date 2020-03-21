module Mutations
  class CreateSourceContent < BaseMutation
    argument :link, String, required: false
    argument :content_maker_id, ID, required: false

    field :link, String, null: false

    def resolve(link: nil, content_maker_id: nil)
      content_category = if link.end_with? "mp3"
          "PODCAST"
        elsif link.include? "youtu"
          "YOUTUBE"
        else
          "OTHER"
        end

      content = SourceContent.create!(
        link: link,
        content_category: content_category,
        content_maker: ContentMaker.find(id: content_maker_id),
      )
    end
  end
end
