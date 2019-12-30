# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation
## 1. users Table
|Column|Type|Options|
|------|----|-------|
|email|string|null: false, unique: true|
|nickname|string|null: false, unique: true|
|password|string|null: false|

### Association
- has_many :visit_counts, dependent: :destroy
- has_many :shops


## 2. visit_counts Table
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|shop_id|integer|null: false, foreign_key: true|
|visit_date|datetime|null: false|
|count|integer|null: false|

### Association
- belongs_to :user


## 3. shops Table
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|address|string|null: false|
|map|string|null: false|
|holiday|string|
|opening_hours|text|null: false|
|menu|text|null: false|
|rule|text|
|detail|text|

### Association
- belongs_to :user
- has_many :noodle_images, dependent: :destroy


## 4. noodle_images Table
|Column|Type|Options|
|------|----|-------|
|shop_id|integer|null: false, foreign_key: true|
|image|string|null: false|

### Association
- belongs_to :shop



* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
