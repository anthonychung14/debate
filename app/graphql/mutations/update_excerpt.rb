module Mutations
  class UpdateExcerpt < BaseMutation
    argument :excerpt_id, ID, required: true
    argument :link_url, String, required: false

    field :link, String, null: false

    def resolve(excerpt_id: nil, link_url: nil)
      puts excerpt_id
      puts "--------------- UPDATE EXCERPT ------------------"
      Excerpt.update(excerpt_id,
                     :link => link_url)
    end
  end
end
