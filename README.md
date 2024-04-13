# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false, unique: true |
| encrypted_password           | string | null: false |
| name           | string | null: false |
| name_kana           | string | null: false |
| date_of_birth           | string | null: false |

## items テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| image | string | null: false |
| name   | string | null: false |
| explanation | text | null: false |
| category   | string | null: false |
| situation | string | null: false |
| delivery_charge | string | null: false |
| shipping_area | string | null: false |
| number_of_days_until_shipping | string | null: false |
| price   | integer | null: false |
| user   | references | null: false, foreign_key: true |

## buyers テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| room   | references | null: false, foreign_key: true |

## address_informationテーブル
| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| prefectures | string | null: false, unique: true |
| municipalities | string | null: false, unique: true |
| street_address | string | null: false, unique: true |
| building_name | string | null: false, unique: true |
| telephone_number | string | null: false, unique: true |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |