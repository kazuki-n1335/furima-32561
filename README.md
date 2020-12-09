# README
# テーブル設計

## users テーブル

| Column              | Type    | Options                |
| ------------------- | ------- | ---------------------- |
| nickname            | string  | null: false            |
| email               | string  | add_index unique: true |
| encrypted_password  | string  | null: false            |
| family_name         | string  | null: false            |
| first_name          | string  | null: false            |
| reading_family_name | string  | null: false            |
| reading_first_name  | string  | null: false            |
| birth_day           | date    | null: false            |


### Association
- has_many :items
- has_many :buys

## items テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | -------------------------------|
| name             | string     | null: false                    |
| introduce        | text       | null: false                    |
| value            | integer    | null: false                    |
| item_status_id   | integer    | null: false                    |
| delivery_fee_id  | integer    | null: false                    |
| shipping_area_id | integer    | null: false                    |
| shipping_days_id | integer    | null: false                    |
| user             | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :buy
- has_one_attached :image


## buys テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :address
- belongs_to :item

## addresses テーブル

| Column           | Type       | Options                        |
| -----------------| ---------- | -------------------------------|
| post_number      | string     | null: false                    |
| prefecture_id    | integer    | null: false                    |
| city             | string     | null: false                    |
| house_number     | string     | null: false                    |
| building_name    | string     |                                |
| telephone_number | string     | null: false                    |
| buy              | references | null: false, foreign_key: true |

### Association
- belongs_to :buy