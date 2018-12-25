# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

## usersテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|string|null:false|
|password|string|null:false|
|email   |string|null:false,unique:true|
|profile |text|
|profile_image|text|
|gender  |string|null:false|
|prefecture|reference|null:false,foreign_key: true|
|age     |string|null:false|
|instagram|string|
|customer_id|string|
|reset_password_token|string|
|reset_password_sent_at|datetime|


### Association
- belongs_to :prefecture
- has_many :lectures
- has_many :reviews
- has_many :favorites
- has_many :messages,dependent: :destroy
- has_many :entries,dependent: :destroy
- has_many :relationships
- has_many :following_relationships, foreign_key: "follower_id", class_name: "Relationship", dependent: :destroy


## mesasgesテーブル

|Column|Type|Options|
|------|----|-------|
|content|text|null:false|
|user_id|reference|foreign_key: true|
|room_id|reference|foreign_key: true|

### Association
- belongs_to :user
- belongs_to :room


## roomsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null:false|

### Association
- has_many :messages
- has_many :entries

## entriesテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|reference|foreign_key: true|
|room_id|reference|foreign_key: true|

### Association
- belongs_to :user
- belongs_to :room


## lecturesテーブル

|Column|Type|Options|
|------|----|-------|
|title |string|null:false|
|sumary|text|null:false|
|note  |text|null:false|
|time  |string|null:false|
|area  |string|null:false|
|image1|text|
|image2|text|
|image3|text|
|way   |string|null:false|
|price |integer|null:false|
|cost|string|
|target|string|
|condition|reference|null:false,foreign_key: true|
|genre|reference|null:false,foreign_key: true|
|prefecture|reference|null:false,foreign_key: true|
|user_id|reference|null:false,foreign_key: true|

### Association
- belongs_to :user
- belongs_to :condition
- belongs_to :genre
- belongs_to :prefecture
- has_many :favorites
- has_many :reviews
- has_many :relationships
- has_many :following_relationships, foreign_key: "follower_id", class_name: "Relationship", dependent: :destroy

## conditionsテーブル

|Column|Type|Options|
|------|----|-------|
|status|string|

### Association
- has_many :lectures

## genresテーブル

|Column|Type|Options|
|------|----|-------|
|type|string|

### Association
- has_many :lectures

## reviewsテーブル

|Column|Type|Options|
|------|----|-------|
|comment|text|null:false|
|rate|integer|null:false|
|user_id|reference|foreign_key: true|
|lecture_id|reference|foreign_key: true|


### Association
- has_many :lectures
- has_many :users

## prefecturesテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null:false,unique|

### Association
- has_many :lectures
- has_many :users


## relationshipsテーブル

|Column|Type|Options|
|------|----|-------|
|follower_id|integer|
|following_id|integer|

### Association
- belongs_to :user
- belongs_to :lecture


## favoritesテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|reference|foreign_key: true|
|lecture_id|reference|foreign_key: true|


### Association
- belongs_to :lecture
- belongs_to :user
