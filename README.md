# テーブル設計

## users テーブル

| Column               | Type    | Options     |
| -------------------- | ------- | ----------- |
| nickname             | string  | null: false |
| mail                 | string  | null: false |
| password             | string  | null: false |
| family_name          | string  | null: false |
| first_name           | string  | null: false |
| family_name_katakana | string  | null: false |
| first_name_katakana  | string  | null: false |
| birth_day            | integer | null: false |
| birth_month          | integer | null: false |
| birth_year           | integer | null: false |

### Association

- has_many :items
- has_many :purchase_records
- has_many :customers

## items テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| item_name       | string     | null: false                    |
| text            | text       | null: false                    |
| category        | string     | null: false                    |
| detail          | string     | null: false                    |
| burden          | string     | null: false                    |
| shipment_source | string     | null: false                    |
| number_of_days  | string     | null: false                    |
| user_id         | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase_record
- has_one :customer

## customers テーブル

| Column        | Type         | Options                        |
| ------------- | ------------ | ------------------------------ |
| postal_code   | varchar(8)   | null: false                    |
| prefecture    | string       | null: false                    |
| city          | string       | null: false                    |
| house_number  | string       | null: false                    |
| building_name | string       | null: false                    |
| phone_number  | varachar(13) | null: false                    |
| user_id       | references   | null: false, foreign_key: true |
| item_id       | references   | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item

## purchase_record テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| user_id       | references | null: false, foreign_key: true |
| item_id       | references | null: false, foreign_key: true |
| purchase_time | datetime   | null: false                    |

### Association

- belongs_to :user
- belongs_to :item