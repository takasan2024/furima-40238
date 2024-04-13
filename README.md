# データベース設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false, unique: true |
| encrypted_password           | string | null: false |
| shi           | string | null: false |
| shi_kana           | string | null: false |
| mei           | string | null: false |
| mei_kana           | string | null: false |
| date_of_birth           | date | null: false |

### Association
has_many :items
has_many :buyers

## items テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| name   | string | null: false |
| explanation | text | null: false |
| category_id | integer| null: false |
| situation_id | integer| null: false |
| delivery_charge_id | integer| null: false |
| shipping_area_id | integer| null: false |
| number_of_days_until_shipping_id | integer| null: false |
| price   | integer | null: false |
| user   | references | null: false, foreign_key: true |

### Association
belongs_to :user
has_one :address_information

## buyers テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association
belongs_to :user
belongs_to :item
has_one :address_information

## address_information テーブル
| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| post_code | string | null: false |
| shipping_area_id | integer| null: false |
| municipalities | string | null: false |
| street_address | string | null: false |
| building_name | string |     |
| telephone_number | string | null: false |
| buyer   | references | null: false, foreign_key: true |

### Association
belongs_to :buyer