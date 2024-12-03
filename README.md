# README

## 構築手順
上から順番進めていって、docker-compose upまでできたらZennの資料みながら進める

### 1. cloneするディレクトリに移動
(どこでもいい。 ~ とか)
```
cd ~
```

### 2. cloneする
```
git clone git@github.com:takumi0703/tutorial-graphql.git 
```

### 3. cloneしたディレクトリに移動
(もしかしてファイル名違うかも)
```
 cd tutorial-graphql
```

### 4. 作業ブランチに移動
(mainはすでに資料進めちゃったやつだから、進める前に戻したtutorial_mainを使う)
```
git checkout tutorial_main
```

### 5. docker-compose upできるようにする
```
docker-compose build
docker-compose up
```

### 6. rails サーバーが正常に起動するか確認する

http://localhost:3000/

### 7. 資料みながら、進める

[\[Rails基礎\] GraphQL基礎講座](https://zenn.dev/igaiga/books/rails-practice-note/viewer/rails_graphql_workshop)

[とりあえずここまで進めればグットかな](https://zenn.dev/igaiga/books/rails-practice-note/viewer/rails_graphql_workshop#1%E3%81%A4%E5%8F%96%E5%BE%97%E3%81%99%E3%82%8B-field-%3Auser)

進めれそうだったら、[ここまで](https://zenn.dev/igaiga/books/rails-practice-note/viewer/rails_graphql_workshop#resolver)やれれば完璧

# 資料みながら、進める上での注意点

## 1. rails g コマンドは、`docker-compose run --rm web`を先頭につける
資料ではdockerを使っていないので、例えば

>次のコマンドを実行します。
$ bin/rails g graphql:install

こういうrailsコマンドは、`docker-compose run --rm web`
を先頭につけて実行してね。
つけた後のコマンド例
`docker-compose run --rm web bin/rails g graphql:install`

(もしかしたらエラーになるかも。その場合、bin/ を消して実行してみて `docker-compose run --rm web rails g graphql:install`)

## 2. 動作確認時について
```
動作確認します。

$ bin/rails s`
```
とかの記述の時は、`docker-compose down`して`docker-compose up`すればOK

## 3. gem を追加した後

特に bundle installしてとか書いてないけど、必要だから、`docker-compose down`→`docker-compose build`→`docker-compose up`してー