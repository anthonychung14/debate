module Mutations
  class CreateExcerpt < BaseMutation
    # arguments passed to the `resolve` method
    argument :content_id, ID, required: true
    argument :start_position, Int, required: true
    argument :end_position, Int, required: true

    # return type from the mutation
    # type Types::AuthorType
    field :source_content_id, ID, null: false
    field :start_position, Int, null: false
    field :end_position, Int, null: false

    def resolve(content_id: nil, start_position: nil, end_position: nil)
      # HardWorker.perform_async(content_id, start_position, end_position)

      Excerpt.create!(
        source_content_id: content_id,
        start_position: start_position,
        end_position: end_position,
      )
    end
  end
end
