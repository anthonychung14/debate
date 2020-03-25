module Mutations
  class UpdateExcerpt < BaseMutation
    argument :excerpt_id, ID, required: true
    argument :link_url, String, required: false
    argument :content_medium, String, required: false

    field :link, String, null: false

    def resolve(excerpt_id: nil, link_url: nil, content_medium: nil)
      puts content_medium
      puts "--------------- UPDATE EXCERPT ------------------"
      Excerpt.update(excerpt_id,
                     :link => link_url, :content_medium => content_medium)
    end
  end
end
