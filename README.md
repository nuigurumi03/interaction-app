# README

##　usersテーブル
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string |             |

## アソシエーション
- has_one :profile


## profileテーブル
| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| user_id            | integer | null: false |
| birthyear          | integer | null: false |
| birthmonth         | integer | null: false |
| birthday           | integer | null: false |
| family_name        | string  | null: false |
| personal_name      | string  | null: false |
| family_name_kana   | string  | null: false |
| personal_name_kana | string  | null: false |
| postal_code        | string  |             |
| prefecture         | string  |             |
| city               | string  |             |
| tell               | string  |             |
| house_code         | string  |             |
| build_name         | string  |             |

##　アソシエーション
- belongs_to :user