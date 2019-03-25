# README
###データベース設計
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
|nickname|string|index: true, null: false|
|email|string|null: false, unique:true|
|lastname|string|null: false|
|firstname|string|null: false|
|lastnamekana|string|null: false|
|firstnamekana|string|null: false|
|birthyear|integer|null: false|
|birthmonth|integer|null: false|
|birthday|integer|null: false|
|postnumber|string|null: false|
|prefecture|references|null: false|
|shikuchouson|string|null: false|
|banchi|string|null: false|
|tatemonomei|string||
|phonenumber|string|null false|
|encrypted_password|string|null: false, default: ""|
|reset_password_token|string|
|reset_password_sent_at|datetime|
|remember_created_at|datetime|

<!-- passより下のカラムはdeviseで自動で作成される -->

### Association
- has_many :buyed_items, foreign_key: "buyer_id", class_name: "Item"
- has_many :saling_items, -> { where("buyer_id is NULL") }, foreign_key: "saler_id", class_name: "Item"
- has_many :sold_items, -> { where("buyer_id is not NULL") }, foreign_key: "saler_id", class_name: "Item"
- has_many :creditcards
- belongs_to :prefecture
- has_many :comments

## creditcardsテーブル

|Column|Type|Options|
|------|----|-------|
|user|references|    |
|kind|string|null: false|
|number|string|null: false|
|expyear|integer|null: false|
|expmonth|integer|null: false|
|securitycode|string|null: false|

<!-- 数字でも０から始まる可能性あるものはintegerでなくstringにする -->

### Association
- belongs_to :user

## prefecturesテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|


### Association
- has_many :users

## itemsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|index: true,null: false|
|description|string|null: false|
|condition|string|null: false|
|postage|string|null: false|
|region|string|null: false|
|shipping_date|string|null: false|
|price|integer|null: false|
|saler|references|null: false|
|buyer|references|  |

<!-- condition(商品の状態),postage(配送料の負担),region(発送元地域),shipping_date(発送までの日数) -->

### Association
- belongs_to :saler, class_name: "User"
- belongs_to :buyer, class_name: "User"
- has_many :images
- belongs_to :brand
- belongs_to :bigcategory
- belongs_to :middlecategory
- belongs_to :smallcategory

## commentsテーブル

|Column|Type|Options|
|------|----|-------|
|user|references|      |
|item|references|      |
|text|text|null: false|

### Association
- belongs_to :item
- belongs_to :user

## imagesテーブル

|Column|Type|Options|
|------|----|-------|
|item|references|    |
|image|string|    |

### Association
- belongs_to :item

## brandsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false,index: true|


### Association
- has_many :items

## bigcategorysテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false,index: true|


### Association
- has_many :items
- has_many :middlecategorys

## middlecategorysテーブル

|Column|Type|Options|
|------|----|-------|
|bigcategory_id|references|    |
|name|string|null: false,index: true|

### Association
- has_many :items
- has_many :smallcategorys
- belongs_to :bigcategory

## smallcategorysテーブル

|Column|Type|Options|
|------|----|-------|
|middlecategory_id|references|    |
|name|string|null: false,index: true|



### Association
- has_many :items
- belongs_to :middlecategory
