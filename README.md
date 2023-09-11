# README

## users テーブル 　　　　　　　　　　#新規情報

| Column              | Type   | Options                   |
| ------------------  | ------ | ------------------------- |
| nickname            | string | null: false               |
| encrypted_password  | string | null: false               |
| email               | string | null: false, unique: true |
| name_last_name      | string | null: false               |
| name_first_name     | string | null: false               |
| name_last_name_kana | string | null: false               |
| name_first_name_kana| string | null: false               |
| birthday            | date   | null: false               |


### Association

- has_many :items
- has_many :orders


## items テーブル　　　　　　　　　　#商品情報

| Column             | Type      | Options                       |
| ------------------ | --------- | ----------------------------- |
| productname        | string    | null: false                   |
| explanation        | text      | null: false                   |
| category_id        | integer   | null: false                   |
| condition_id       | integer   | null: false                   |
| derivary_charge_id | integer   | null: false                   |
| prefecture_id      | integer   | null: false                   |
| delivery_day_id    | integer   | null: false                   |
| selling_price      | integer   | null: false                   |
| user               | references| null: false,foreign_key: true |


### Association

- has_one :order
- belongs_to :user


## orders テーブル　　　　　#購入記録

| Column             | Type       | Options                      |
| ------------------ | ---------- | ---------------------------- |
| user               | references | null: false,foreign_key: true|
| item               | references | null: false,foreign_key: true|


### Association

- belongs_to :user
- belongs_to :item
- has_one :address


## addresses テーブル　　　#発送先情報

| Column             | Type      | Options                       |
| ------------------ | --------- | ----------------------------- |
| address            | string    | null: false                   |
| prefecture_id      | integer   | null: false                   |
| city               | string    | null: false                   |
| streetad           | string    | null: false                   |
| building           | string    |                               |
| phone_number       | string    | null: false                   |
| order              | references| null: false,foreign_key: true |



### Association

- belongs_to :order




