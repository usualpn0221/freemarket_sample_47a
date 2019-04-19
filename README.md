# README
###データベース設計
This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
ruby 2.5.1p57
* Rails version
Rails 5.0.7.2

* DB設計補足
uservaluationsテーブル、commentsテーブル、brandsテーブルは構想のみ。

## usersテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|string|index: true, null: false|
|email|string|null: false, unique:true|
|encrypted_password|string|null: false, default: ""|
|reset_password_token|string|
|reset_password_sent_at|datetime|
|remember_created_at|datetime|
|lastname|string|
|firstname|string|
|lastnamekana|string|
|firstnamekana|string|
|birthyear|integer|
|birthmonth|integer|
|birthday|integer|

<!-- passより下のカラムはdeviseで自動で作成される -->

### Association
- has_many :items
- has_many :trades
- has_many :cards
- has_many :comments
- has_many :uservaluations,foreign_key: "evaluateduser_id", class_name: "Uservaluation"
- has_one  :profile,dependent: :destroy
- has_one  :phonenumber,dependent: :destroy
- has_many :snsCredentials, dependent: :destroy

## SnsCredentialsテーブル

|Column|Type|Options|
|------|----|-------|
|provider|string|
|uid|string|
|user|references|

### Association
- belongs_to :user

## cardsテーブル

|Column|Type|Options|
|------|----|-------|
|pay_id|string|
|customer_id|string|
|user|references|

### Association
- belongs_to :user

## prefecturesテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|


- active hashのみ使用

## profilesテーブル

|Column|Type|Options|
|------|----|-------|
|user|references|      |
|postnumber|string|null: false|
|shikuchouson|string|null: false|
|banchi|string|null: false|
|tatemonomei|string||
|user|references|
|lastname|string|
|firstname|string|
|lastnamekana|string|
|firstnamekana|string|
|prefecture|string|
|phonenumber|string|

### Association
- belongs_to :user

## phonenumbersテーブル

|Column|Type|Options|
|------|----|-------|
|phonenumber|string|null: false|
|user|references|


### Association
- belongs_to :user

## itemsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|index: true,null: false|
|description|text|null: false|
|trade_status|string|null: false|
|price|string|null: false|
|user|references|null: false|
|item_conditon|string|null: false|
|category|references|null: false|
|brand|references|null: false|
|saizu|string|null: false|

<!-- saizuはsizeのこと。予約語回避のため -->

### Association
- belongs_to :user
- has_one  :trade
- has_many :images
- belongs_to :brand
- belongs_to :category
- accepts_nested_attributes_for :images,allow_destroy: true
- accepts_nested_attributes_for :trade,update_only: true

## tradesテーブル

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
- belongs_to :buyer,class_name: "User",optional: true


## imagesテーブル

|Column|Type|Options|
|------|----|-------|
|item|references|    |
|image|string|    |

### Association
- belongs_to :item, optional: true

## categorysテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|
|parent|references|    |


### Association
- belongs_to :parent, class_name: :Category, optional: true
- has_many :children, class_name: :Category, foreign_key: :parent_id

## brandsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false,index: true|


### Association
- has_many :items


## commentsテーブル

|Column|Type|Options|
|------|----|-------|
|user|references|      |
|item|references|      |
|text|text|null: false|

### Association
- belongs_to :item
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

