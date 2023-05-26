# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| mail               | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| name               | string | null: false               |
| name_kana          | string | null: false               |
| dare_of_birth      | date   | null: false               |

### Association

- has_many :items
- has_many :purchase_records


## items テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| product_name       | type       | null: false                    |
| explanation        | text       | null: false                    |
| category_id        | integer    | null: false                    |
| situation_id       | integer    | null: false                    |
| delivery_charge_id | integer    | null: false                    |
| prefectures_id     | integer    | null: false                    |
| date_of_shipment_id| integer    | null: false                    |
| price              | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association

- has_one :purchase_record
- belongs_to :user

## purchase_recordsテーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| item               | references | null: false, foreign_key: true |
| user               | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- has_one :item


## shipping_address テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| post_code          | string     | null: false                    |
| prefectures_id     | integer    | null: false                    |
| municipalities     | string     | null: false                    |
| address            | string     | null: false                    |
| building_name      | string     |                                |
| number             | string     | null: false                    |
| purchase_records   | references | null: false, foreign_key: true |

### Association

- has_one :purchase_record

