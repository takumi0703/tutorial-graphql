# frozen_string_literal: true

module Resolvers
  class UserResolver < GraphQL::Schema::Resolver
    description "ユーザー情報を取得する"
    # types/query_type.rb と同じ書き方だとエラーになる
    # field :user, Types::UserType, null: false do
    #   argument :id, ID, required: true
    # end
    type Types::UserType, null: false

    argument :id, ID, required: true

    def resolve(id:)
      User.find(id)
    end
  end
end
