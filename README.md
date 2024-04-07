# データベース設計

## users テーブル

|Column|Type|Options|
|------|----|-------|
|nick name|string|null: false |
|email    |string|null: false unique: true|
|password |string|null: false |


### Association

- has_many :items
- has_many :buyers

## items テーブル

|Column|Type|Options|
|------|----|-------|
|name    |string|null: false |
|category|string|null: false |
|price   |string|null: false |
|user    |references|null: false, foreign_key: true|


### Association

- belongs to :user
- has_many :buyers

## buyers テーブル

|Column|Type|Options|
|------|----|-------|
|address    |string|null: false unique: true|
|user    |references|null: false, foreign_key: true|
|items    |references|null: false, foreign_key: true|

### Association

- belongs to :user
- belongs to :item
