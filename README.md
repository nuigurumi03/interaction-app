## README

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
| prefecture_id      | integer |             |
| city               | string  |             |
| tell               | string  |             |
| house_code         | string  |             |
| build_name         | string  |             |

##　アソシエーション
- belongs_to :user
- belongs_to_active_hash :prefecture


## postテーブル
| Column        | Type    | Options           |
| ------------- | ------- | ----------------- |
| user_id       | integer | foreign_key: true |
| title         | string  | null: false       |
| detail        | text    | null: false       |
| prefecture_id | integer | null: false       |
| city          | string  | null: false       |
| house_code    | string  |                   |
| build_name    | string  |                   |

## アソシエーション
- belongs_to :user
- belongs_to_active_hash :prefecture
- has_many :images


## imagesテーブル
| Column  | Type    | Options           |
| ------- | ------- | ----------------- |
| image   | string  | null: false       |
| post_id | integer | foreign_key: true |

## アソシエーション
- belongs_to :post
