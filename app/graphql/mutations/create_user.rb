# frozen_string_literal: true

# クエリ例(mutation は省略できない)
# mutation {
#   createUser(
#     input:{
#       name: "user1"
#       email: "user@example.com"
#     }
#   ){
#     user {
#       id
#       name 
#       email
#     }
#   }
# }
module Mutations
  class CreateUser < BaseMutation
    field :user, Types::UserType, null: false

    argument :name, String, required: true
    argument :email, String, required: true

    def resolve(name:, email:)
      user = User.create!(name: name, email: email)
      { user: user }
    end
  end
end
