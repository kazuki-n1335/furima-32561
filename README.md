# README
# テーブル設計

## users テーブル

| Column              | Type    | Options     |
| ------------------- | ------- | ----------- |
| nickname            | string  | null: false |
| email               | string  | null: false |
| password            | string  | null: false |
| family_name         | string  | null: false |
| first_name          | string  | null: false |
| reading_family_name | string  | null: false |
| reading_first_name  | string  | null: false |
| birth_year          | integer | null: false |
| birth_month         | integer | null: false |
| birth_day           | integer | null: false |

### Association
- has_many :items
- has_many :comments
- has_many :buys

## items テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | -------------------------------|
| name          | string     | null: false                    |
| introduce     | text       | null: false                    |
| value         | integer    | null: false                    |
| item_status   | integer    | null: false                    |
| delivery_fee  | integer    | null: false                    |
| shipping_area | integer    | null: false                    |
| shipping_days | integer    | null: false                    |
| user          | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_many :comments
- has_one :buy
- has_one_attached :image

## comments テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| comment | string     | null: false                    |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item

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
| ------------- ---| ---------- | -------------------------------|
| post_number      | integer    | null: false                    |
| prefecture       | integer    | null: false                    |
| city             | string     | null: false                    |
| house_number     | string     | null: false                    |
| building_name    | string     |                                |
| telephone_number | string     | null: false                    |
| buys             | references | null: false, foreign_key: true |

### Association
- belongs_to :buy