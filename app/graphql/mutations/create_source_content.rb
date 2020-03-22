module Mutations
  class CreateSourceContent < BaseMutation
    argument :link, String, required: false
    argument :title, String, required: false
    argument :md5hash, String, required: false
    argument :content_maker_id, ID, required: false

    field :link, String, null: false
    field :title, String, null: false
    field :id, ID, null: false
    field :content_category, Types::ContentCategory, null: false

    def resolve(link: nil, content_maker_id: nil, title: nil)
      content_category = if link.end_with? "mp3"
          "PODCAST"
        elsif link.include? "youtu"
          "YOUTUBE"
          # TODO: do this better so we can have video => gif trimming
        elsif link.include? "firebasestorage"
          "IMAGE"
        else
          "OTHER"
        end

      SourceContent.create!(
        link: link,
        content_category: content_category,
        title: title,
        content_makers: [ContentMaker.find(content_maker_id)],
      )
    end
  end
end
