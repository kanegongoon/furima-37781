# テーブル設計

## users テーブル

|Column              |Type     |Options                   |
|--------------------|---------|--------------------------|
| nickname           | string  | null: false              |
| email              | string  | null: false,unique: true |
| encrypted_password | string  | null: false              |
| first_name         | string  | null: false              |
| last_name          | string  | null: false              |
| first_name_kana    | string  | null: false              |
| last_name_kana     | string  | null: false              |
| birthday           | date    | null: false              |


### Association

 - has_many :items
 - has_many :purchase_records


## items テーブル

|Column            |Type        |Options      |
|------------------|------------|-------------|
| name             | string     | null: false |
| explanation      | text       | null: false |
| category         | integer    | null: false |
| condition        | integer    | null: false |
| shipping_charges | integer    | null: false |
| prefecture       | integer    | null: false |
| days             | integer    | null: false |
| price            | integer    | null: false |
| user             | references | null: false |


### Association
 - has_one :purchase_recode
 - belongs_to :user


## addresses テーブル

|Column         |Type        |Options      |
|---------------|------------|-------------|
| postal_code   | string     | null: false |
| prefecture_id | integer    | null: false |
| city          | string     | null: false |
| house_number  | string     | null: false |
| building_name | string     |
| phone_number  | string     | null: false |


### Association
 - belongs_to :purchase_record


## purchase_record テーブル
|Column     |Type        |Options                        |
|-----------|------------|-------------------------------|
| user      | references | null: false,foreign_key: true |
| item      | references | null: false,foreign_key: true |


### Association
 - belongs_to :users
 - belongs_to :items
 - has_one :addresses