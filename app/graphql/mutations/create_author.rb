module Mutations
  class CreateAuthor < BaseMutation
    # arguments passed to the `resolve` method
    argument :full_name, String, required: true
    argument :occupation, String, required: false

    field :full_name, String, null: false

    def resolve(full_name: nil, occupation: nil)
      Author.create!(
        full_name: full_name,
        occupation: occupation,
      )
    end
  end
end
