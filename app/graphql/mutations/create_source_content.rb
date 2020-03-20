module Mutations
  class CreateSourceContent < BaseMutation
    argument :link, String, required: false
    argument :author_id, ID, required: false

    field :link, String, null: false

    def resolve(link: nil, author_id: nil)
      content_category = if link.end_with? "mp3"
          "PODCAST"
        elsif link.include? "youtu"
          "YOUTUBE"
        else
          "OTHER"
        end

      SourceContent.create!(
        link: link,
        author: Author.find(author_id),
        content_category: content_category,
      )
    end
  end
end
