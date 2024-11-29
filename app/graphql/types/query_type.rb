# frozen_string_literal: true

# GraphQLのクエリ内容を定義するクラス
# fieldを追加した場合は、再起動(docker-compose up)が必要
# メモ: fieldの名前は、定義はスネークだけど、クエリ時は、キャメルケースである必要がある
module Types
  class QueryType < Types::BaseObject
    # node fieldはデフォルトで定義されていて、なんか便利なことができるらしい
    # field :node, Types::NodeType, null: true, description: "Fetches an object given its ID." do
    #   argument :id, ID, required: true, description: "ID of the object."
    # end
    # def node(id:)
    #   context.schema.object_from_id(id, context)
    # end
    # field :nodes, [Types::NodeType, null: true], null: true, description: "Fetches a list of objects given a list of IDs." do
    #   argument :ids, [ID], required: true, description: "IDs of the objects."
    # end
    # def nodes(ids:)
    #   ids.map { |id| context.schema.object_from_id(id, context) }
    # end

    # 特定ユーザー情報を取得するための記述(resolverを使わない場合)
    #
    # field :user, Types::UserType, null: false do
    #   argument :id, ID, required: true
    # end
    # # field に指定された値に対して返す値を定義する
    # # メソッド名とfieldの名前が一致している必要があるよう
    # def user(id:)
    #   User.find(id)
    # end
    #
    # クエリ例(query という文字は省略可)
    # query {
    #   user(id: "1") {
    #     id
    #     name
    #     email
    #   }
    # }

    # 特定ユーザー情報を取得するための記述(resolverを使う場合)
    field :user, resolver: Resolvers::UserResolver

    # 複数の場合は、第二引数にtypeを[]で囲う
    # 全ユーザー情報を取得するための記述
    field :users, [Types::UserType], null: false
    # field に指定された値に対して返す値を定義する
    # メソッド名とfieldの名前が一致している必要があるよう
    def users
      User.all
    end
    # クエリ例
    # query {
    #   users {
    #     id
    #     name
    #     email
    #   }
    # }
  end
end
