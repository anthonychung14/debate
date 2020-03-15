module Mutations
  class CreateCreator < BaseMutation
    # arguments passed to the `resolve` method
    argument :email, String, required: true

    # return type from the mutation
    field :errors, [String], null: false
    field :email, String, null: false

    def resolve(email: nil)
      Creator.create!(
        email: email,
      )
    end
  end
end
