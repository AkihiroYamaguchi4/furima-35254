# テーブル設計

## users テーブル

| Column              | Type   | Options                  |
| ------------------- | ------ | -----------              |
| email               | string | null: false,unique: true |
| password            | string | null: false              |
| nickname            | string | null: false,unique: true |
| family_name         | string | null: false              |
| first_name          | string | null: false              |
| family_name_reading | string | null: false              |
| family_name_reading | string | null: false              |
| birth_id            | integer | null: false             |

### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column           | Type               | Options            |
| ---------------- | ------------------ | -------------------- |
| product          | string             | null: false          |
| image            | ActiveStorageで実装 |                      |
| category_id      | integer            | null: false          |
| information      | text               | null: false          |
| condition_id     | integer            | null: false          |
| shipping_fee_id  | integer            | null: false          |
| shipping_area_id | integer            | null: false          |
| days_to_ship_id  | integer            | null: false          |
| selling_price    | integer            | null: false          |
| user             | references null: false, foreign_key: true |

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

| Column           | Type               |   Options            |
| ---------------- | ------------------ | -------------------- |
| postal_code      | integer            |null: false           |
| prefecture_id    | string             | null: false          |
| city             | string             | null: false          |
| house_number     | string             | null: false          |
| building_name    | string             |                      |
| phone_number     | integer            | null: false          |
| purchase_id      | references null: false, foreign_key: true |
| user             | references null: false, foreign_key: true |

### Association

- belongs_to :purchase

