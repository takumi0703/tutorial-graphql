# frozen_string_literal: true

# GraphQLのクエリ内容を定義するクラス
# fieldを追加した場合は、再起動(docker-compose up)が必要
module Types
  class QueryType < Types::BaseObject
    field :node, Types::NodeType, null: true, description: "Fetches an object given its ID." do
      argument :id, ID, required: true, description: "ID of the object."
    end
    def node(id:)
      context.schema.object_from_id(id, context)
    end
    field :nodes, [Types::NodeType, null: true], null: true, description: "Fetches a list of objects given a list of IDs." do
      argument :ids, [ID], required: true, description: "IDs of the objects."
    end
    def nodes(ids:)
      ids.map { |id| context.schema.object_from_id(id, context) }
    end

    # 例
    # クエリで指定する時は、testField(キャメルケース)である必要がある
    # field :test_field, String, null: false,
    #   description: "An example field added by the generator"
    # def test_field
    #   "Hello World!"
    # end

    # クエリ例(query は省略化)
    # query {
    #   user(id: "1") {
    #     id
    #     name
    #     email
    #   }
    # }
    field :user, Types::UserType, null: false do
      argument :id, ID, required: true
    end
    # field に指定された値に対して返す値を定義する
    # メソッド名とfieldの名前が一致している必要があるよう
    def user(id:)
      User.find(id)
    end

    # 複数の場合は、第二引数にtypeを[]で囲う
    # クエリ例
    # query {
    #   users {
    #     id
    #     name
    #     email
    #   }
    # }
    field :users, [Types::UserType], null: false
    # field に指定された値に対して返す値を定義する
    # メソッド名とfieldの名前が一致している必要があるよう
    def users
      User.all
    end
  end
end
