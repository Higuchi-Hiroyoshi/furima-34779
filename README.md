# テーブル設計

## users テーブル

| Column              | Type      | Options                        |
| -----------------   | --------- | ------------------------------ |
| nick_name           | string    | null: false                    |
| email               | string    | null: false                    |
| password            | string    | null: false                    |
| first_name          | string    | null: false                    |
| last_name           | string    | null: false                    |
| first_name_kana     | string    | null: false                    |
| last_name_kana      | string    | null: false                    |
| birthday            | date      | null: false                    |

### Association

- has_many :items
- has_many :comments
- has_many :orders


## items テーブル

| Column              | Type      | Options                        |
| ------------------- | --------- | ------------------------------ |
| product_name        | string    | null: false                    |
| price               | interger  | null: false                    |
| description_of_item | text      | null: false                    |
| seller_name         | reference | null: false, foreign_key: true |
| category            | interger  | null: false                    |
| product_condition   | interger  | null: false                    |
| shipping_fee        | interger  | null: false                    |
| shipping_area       | interger  | null: false                    |
| date_of_shipment    | interger  | null: false                    |

### Association

- belongs_to :user
- has_one :order
- has_many :comments


## orders テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| user                | references | null: false, foreign_key: true |
| item                | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :item
- has_one :address


## comments テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| user                | references | null: false, foreign_key: true |
| item                | references | null: false, foreign_key: true |
| text                | text       | null: false                    |

### Association

- belongs_to :user
- belongs_to :item


## addresss テーブル

| Column               | Type      | Options                        |
| -------------------- | --------- | ------------------------------ |
| zip_code             | string    | null: false                    |
| state                | interger  | null: false                    |
| city                 | string    | null: false                    |
| street_address       | string    | null: false                    |
| building             | string    | null: false                    |
| phone_number         | string    | null: false                    |
| order                | interger  | null: false                    |

### Association

- has_one :order