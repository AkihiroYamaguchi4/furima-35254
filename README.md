# テーブル設計

## users テーブル

| Column              | Type   | Options                  |
| ------------------- | ------ | -----------              |
| email               | string | null: false,unique: true |
| encrypted_password  | string | null: false              |
| nickname            | string | null: false              |
| family_name         | string | null: false              |
| first_name          | string | null: false              |
| family_name_reading | string | null: false              |
| family_name_reading | string | null: false              |
| birth_id            | date   | null: false             　|

### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column           | Type               | Options                        |
| ---------------- | ------------------ | ------------------------------ |
| product          | string             | null: false                    |
| category_id      | integer            | null: false                    |
| information      | text               | null: false                    |
| condition_id     | integer            | null: false                    |
| shipping_fee_id  | integer            | null: false                    |
| prefecture_id    | integer            | null: false                    |
| days_to_ship_id  | integer            | null: false                    |
| selling_price    | integer            | null: false                    |
| user             | references         | null: false, foreign_key: true |

### Association

- has_one   :purchase
- belongs_to :user

## purchases テーブル

| Column    | Type       | Options                        |
| ------    | ------     | -----------                    |
| user      | references | null: false, foreign_key: true |
| item      | references | null: false, foreign_key: true |
### Association

- belongs_to :item
- belongs_to :user
- has_one :shipping

## shippings テーブル

| Column           | Type       |   Options                     |
| ---------------- | -----------| ----------------------------- |
| postal_code      | string     | null: false                    |
| prefecture_id    | integer    | null: false                   |
| city             | string     | null: false                   |
| house_number     | string     | null: false                   |
| building_name    | string     |                               |
| phone_number     | string     | null: false                   |
| purchase         | references |null: false, foreign_key: true |

### Association

- belongs_to :purchase

