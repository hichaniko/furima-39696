# README

## users テーブル 　　　　　　　　　　#新規情報

| Column               | Type   | Options                   |
| ------------------   | ------ | ------------------------- |
| nickname             | string | null: false               |
| encrypted_password   | string | null: false               |
| email                | string | null: false, unique: true |
| name(last_name)      | string | null: false               |
| name(first_name)     | string | null: false               |
| name(last_name_kana) | string | null: false               |
| name(first_name_kana)| string | null: false               |
| birthday(year)       | string | null: false               |
| birthday(month)      | string | null: false               |
| birthday(day)        | string | null: false               |


### Association

- has_many :items
- belongs_to :kounyukiroku


## items テーブル　　　　　　　　　　#商品情報

| Column             | Type      | Options                       |
| ------------------ | --------- | ----------------------------- |
| productname        | string    | null: false                   |
| explanation        | string    | null: false                   |
| category           | text      | null: false                   |
| condition          | text      | null: false                   |
| derivary_charge_id | integer   | null: false                   |
| prefecture         | string    | null: false                   |
| day                | datetime  | null: false                   |
| selling_price_id   | integer   | null: false                   |
| user               | references| null: false,foreign_key: true|


### Association

- has_one :kounyukiroku
- belongs_to :user


## kounyukiroku テーブル　　　　　#購入記録

| Column             | Type       | Options                      |
| ------------------ | ---------- | ---------------------------- |
| user               | references | null: false,foreign_key: true|
| item               | references | null: false,foreign_key: true|


### Association

- has_one :user
- belongs_to :item
- has_one :sipping


## sipping テーブル　　　#発送先情報

| Column             | Type      | Options                       |
| ------------------ | --------- | ----------------------------- |
| address            | string    | null: false                   |
| prefecture         | string    | null: false                   |
| city               | string    | null: false                   |
| streetad           | string    | null: false                   |
| building           | string    |                               |
| city               | string    | null: false                   |
| kounyukiroku       | references| null: false,foreign_key: true |



### Association

- bilongs_to :kounyukiroku




