# アプリ名						
フリマアプリ
# 概要
フリマアプリのクローンサイトです。ユーザー登録、商品出品、商品購入、クレジットカード決済機能が可能です。					
# 本番環境(デプロイ先　テストアカウント＆ID)		
接続先情報
https://furima-35254.herokuapp.com/
ID/Pass
ID: admin
Pass: 2222
テスト用アカウント等
購入者用
メールアドレス: test1@test1
パスワード: tttt11
購入用カード情報
番号：4242424242424242
期限：33
セキュリティコード：123
出品者用
メールアドレス名: test2@test2
パスワード: tttt22

# 制作背景(意図)						
- 正しく入力すると新規ユーザー登録できる動画
[![Image from Gyazo](https://i.gyazo.com/6cba06b1cedba209fdf7bc5728fd6fc1.gif)](https://gyazo.com/6cba06b1cedba209fdf7bc5728fd6fc1)

- 正しく情報を記入すると、商品の出品ができる動画
[![Image from Gyazo](https://i.gyazo.com/45c3d288e799825a930a0b19104f3b7d.gif)](https://gyazo.com/45c3d288e799825a930a0b19104f3b7d)

- 正しく情報を記入すると、商品の購入ができる動画
[![Image from Gyazo](https://i.gyazo.com/e83b556b881e0b1431e00dcbdc915d81.gif)](https://gyazo.com/e83b556b881e0b1431e00dcbdc915d81)

# 工夫したポイント
新規出品ページ、商品詳細ページ、購入ページでの複数画像の表示できるようにビューページを変更しました。また、一覧ページでは一枚だけで問題ないので最初に載せた画像を投稿できるようにします。

# 使用技術(開発環境)						
Ruby'2.6.5'
# 課題や今後実装したい機能						
カテゴリーや検索機能を実装することでユーザーが買いたい商品をすぐ見つけやすくしたいと考えています。
# DB設計						
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

