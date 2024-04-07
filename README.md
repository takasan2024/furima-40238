# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false, unique: true |
| password           | string | null: false |

## items テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| name   | string | null: false |
| category   | string | null: false |
| price   | string | null: false |
| user   | references | null: false, foreign_key: true |

## buyers テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| address   | string | null: false, unique: true|
| user   | references | null: false, foreign_key: true |
| room   | references | null: false, foreign_key: true |

