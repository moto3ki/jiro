# アプリ名
## ラーメン二郎　Webアプリ店
### <img width="70%" alt="スクリーンショット 2020-01-24 1 28 25" src="https://user-images.githubusercontent.com/56962584/73003400-efcd5480-3e48-11ea-8a10-f3983ffadf96.png">
### <img width="50%" alt="スクリーンショット 2020-01-24 20 32 01" src="https://user-images.githubusercontent.com/56962584/73066147-9ae11b00-3ee8-11ea-957f-a16246f03075.png">
### <img width="70%" alt="スクリーンショット 2020-01-23 18 35 40" src="https://user-images.githubusercontent.com/56962584/72972690-4027c080-3e0f-11ea-9d85-f2f98b8aa5e7.png">





# 概要
スクールで学んだことを生かし、また行ったことのない実装も前衛的に挑戦し、オリジナルアプリを作成したため紹介します。



# アプリへの思い
私は生粋のジロリアン（ラーメン二郎をこよなく愛する）のため、以前、Yahooブログに開設されていたバイブルでもあるサイト（<http://ramen-jiro.site/pc_store/>）が使用できなくなったためとても悲しい思い出があります。そのため、デフォルトのサイトのようにシンプルで使いやすいWebアプリを作成したく作成しました。悪魔でも、ラーメン二郎のイメージ像を意識したためモダンなデザインでないのはご了承下さい。



# アプリによる課題解決
ラーメン二郎はどこに行っても行列店です。また、各店舗にはそこをホームとするジロリアンが多数存在するためWebアプリを通し、情報の発信、待ち時間の短縮につながればと思います。



# アプリケーション情報
## 接続先情報
- http://54.64.121.47
### アカウント情報
||Eメール|パスワード|
|------|----|-------|
|管理者|example@railstutorial.org|testtest|
|ユーザー|testtest@yahoo.co.jp|testtest|
## 各アカウントの権限
||店舗の情報管理|各店舗でのメッセージ機能|閲覧|
|------|----|-------|-------|
|管理者|○|○|○|
|ログイン状態（ユーザー）|×|○|○|
|ログアウト状態（ゲスト）|×|×|○|
### 画面サンプル
|管理者|ログイン状態（ユーザー）|ログアウト状態（ゲスト）|
|-------|--------|--------|
|<img width="100%" alt="スクリーンショット 2020-01-24 1 28 25" src="https://user-images.githubusercontent.com/56962584/73003400-efcd5480-3e48-11ea-8a10-f3983ffadf96.png">|<img width="100%" alt="スクリーンショット 2020-01-24 1 58 30" src="https://user-images.githubusercontent.com/56962584/73005910-1bead480-3e4d-11ea-87fd-7afd8b76c8d5.png">|<img width="100%" alt="スクリーンショット 2020-01-24 1 58 42" src="https://user-images.githubusercontent.com/56962584/73005986-38870c80-3e4d-11ea-8b21-e73f6d824e38.png">|
## 特徴
- メッセージ機能は、基本的にユーザーが自由な内容を書き込めるが、待ち人数を発信することによって待ち時間の短縮に繋がったり、突然の休みの情報発信に使用できることを想定して実装している。



# 開発状況
## 開発環境
- ruby/Ruby on Rails/haml/scss/javascript/MySQL/Github/AWS/VScode
## 機能一覧
- ログイン機能
- 管理者権限機能
- 店舗の登録・編集機能
- carrierwaveによる画像の登録
- Google_MAP_API（Maps JavaScript API）による地図表示
- 各店舗の掲示板メッセージ機能



# 動作確認方法
- Chromeの最新版を利用してアクセスしてください。
- ただしデプロイ等で接続できないタイミングもございます。その際は少し時間をおいてから接続ください。



# ER図
### <img width="70%" alt="スクリーンショット 2020-01-24 20 40 23" src="https://user-images.githubusercontent.com/56962584/73066614-d4feec80-3ee9-11ea-9616-29ef86d234f5.png">




# DB設計

## 1. users Table
|Column|Type|Options|
|------|----|-------|
|email|string|null: false, unique: true|
|nickname|string|null: false, unique: true|
|password|string|null: false|
|admin|boolean|default: false|


### Association
- has_many :shops
- has_many :messages, dependent: :destroy
- has_many :visit_counts, dependent: :destroy



## 2. visit_counts Table(未実装)
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|shop_id|references|null: false, foreign_key: true|
|visit_date|datetime|null: false|
|count|integer|null: false|

### Association
- belongs_to :user
- belongs_to :shop



## 3. shops Table
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|name|string|null: false|
|address|string|null: false|
|latitude|string|:float|
|longitude|string|:float|
|map|string|null: false|
|holiday|string|
|opening_hours|text|null: false|
|menu|text|null: false|
|rule|text|
|detail|text|


### Association
- belongs_to :user
- has_many :noodle_images, dependent: :destroy
- has_many :messages
- has_many :visit_counts, dependent: :destroy



## 4. noodle_images Table
|Column|Type|Options|
|------|----|-------|
|shop_id|references|null: false, foreign_key: true|
|image|string|null: false|

### Association
- belongs_to :shop


## 5. messages Table
|Column|Type|Options|
|------|----|-------|
|content|string|
|image|string|
|user_id|references|null: false, foreign_key: true|
|shop_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :shop


