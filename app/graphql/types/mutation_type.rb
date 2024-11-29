# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    # bin/rails g graphql:mutation CreateUser で自動生成される
    field :create_user, mutation: Mutations::CreateUser
    # TODO: remove me
    field :test_field, String, null: false,
      description: "An example field added by the generator"
    def test_field
      "Hello World"
    end
  end
end
