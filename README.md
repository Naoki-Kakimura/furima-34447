

## users

| Column             | Type            | Option                  |
|--------------------|-----------------|-------------------------|
| name               | string          | null:false              |
| email              | string          | null:false,unique: true |
| encrypted_password | string          | null:false              |
| first_name_kan     | string          | null: false             |
| last_name_kan      | string          | null: false             |
| first_name_kata    | string          | null: false             |
| last_name_kata     | string          | null: false             |
| birthday           | date            | null: false             |

### Association

- has_many :items
- has_many :comments
- has_many :orders



## items

| Column             | Type               | option                         |
|--------------------|--------------------|--------------------------------|
| name               | string             | null: false                    |
| text               | text               | null: false                    |
| category_id        | integer            | null: false                    |
| status_id          | integer            | null: false                    |
| shipping_charge_id | integer            | null: false                    |
| shipping_day_id    | integer            | null: false                    |
| prefectures_id     | integer            | null: false                    |
| price              | integer            | null: false, 300~9,999,999     |
| user               | references         | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :comments
- has_one :order
- belongs_to :category
- belongs_to :status
- belongs_to :shippingCharge
- belongs_to :shippingDay
- belongs_to :prefectures



## orders

| Column                     | Type       | Option                        |
|----------------------------|------------|-------------------------------|
| user                       | references | null:false, foreign_key: true |
| item                       | references | null:false, foreign_key: true |
| purchase_information_data  | references | null:false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :purchase_information_data



## purchase_information_dates

| Column             | Type            | Option                        |
|--------------------|-----------------|-------------------------------|
| post_num           | string          | null:false, ハイフン必須        |
| prefectures_id     | integer         | null: false                   |
| municipality       | string          | null: false                   |
| address            | string          | null: false                   |
| bill_name          | string          |                               |
| phone_num          | string          | null: false,11桁              |

### Association

- belongs_to :order



## comments

| Column             | Type            | Option                        |
|--------------------|-----------------|-------------------------------|
| user               | references      | null:false, foreign_key: true |
| item               | references      | null:false, foreign_key: true |
| text               | text            | null:false                    |

### Association

- belongs_to :user
- belongs_to :item