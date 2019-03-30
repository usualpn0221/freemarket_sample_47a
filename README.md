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
|encrypted_password|string|null: false, default: ""|
|reset_password_token|string|
|reset_password_sent_at|datetime|
|remember_created_at|datetime|

<!-- passより下のカラムはdeviseで自動で作成される -->

### Association
- has_many :items
- has_many :transactions
- has_many :creditcards
- has_many :comments
- has_many :uservaluations,foreign_key: "evaluateduser_id", class_name: "Uservaluation"
- has_one  :profile

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


## profilesテーブル

|Column|Type|Options|
|------|----|-------|
|user|references|      |
|lastname|string|null: false|
|firstname|string|null: false|
|lastnamekana|string|null: false|
|firstnamekana|string|null: false|
|birthyear|integer|null: false|
|birthmonth|integer|null: false|
|birthday|integer|null: false|
|postnumber|string|null: false|
|prefecture|string|null: false|
|shikuchouson|string|null: false|
|banchi|string|null: false|
|tatemonomei|string||
|phonenumber|string|null false|
|description|text|      |


### Association
- belongs_to :user

## uservaluationsテーブル

|Column|Type|Options|
|------|----|-------|
|evaluateduser|references|    |
|evaluater|references|    |
|kind|string|    |

### Association
- belongs_to :evaluateduser, class_name: "User"
- belongs_to :evaluater, class_name: "User"

## itemsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|index: true,null: false|
|description|text|null: false|
|state|string|null: false|
|price|integer|null: false|
|saler|references|null: false|
|category|references|null: false|

<!-- state(商品の状態) -->

### Association
- belongs_to :saler, class_name: "User"
- has_one  :transaction
- has_many :images
- belongs_to :brand
- belongs_to :category
- accepts_nested_attributes_for :images
- accepts_nested_attributes_for :transaction

## transactionsテーブル

|Column|Type|Options|
|------|----|-------|
|item|references|  |
|buyer|references|  |
|postage|string|null: false|
|delivery|string|null: false|
|region|string|null: false|
|shipping_date|string|null: false|

<!-- postage(配送料の負担),delivery(配送方法),region(発送元地域),shipping_date(発送までの日数) -->

### Association
- belongs_to :item, optional: true
- belongs_to :buyer, class_name: "User"



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
- belongs_to :item, optional: true

## brandsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false,index: true|


### Association
- has_many :items

## categorysテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false,index: true|
|grandparent|references|    |
|parent|references|    |



### Association
- belongs_to :grandparent, class_name: :Category
- has_many :children, class_name: :Category, foreign_key: :grandparent_id
- belongs_to :parent, class_name: :Category
- has_many :grandsons, class_name: :Category, foreign_key: :parent_id
