

## users

| Column             | Type            | Option        |
|--------------------|-----------------|---------------|
| name               | string          | null:false    |
| email              | string          | null:false    |
| encrypted_password | string          | null:false    |
| firstNameKan       | string          | null: false   |
| lastNameKan        | string          | null: false   |
| firstNameKata      | string          | null: false   |
| lastNameKata       | string          | null: false   |
| birthday           | date            | null: false   |


### Association

- has_many :items
- has_many :comments
- has_one :purchaseInformation


## items

| Column             | Type               | option                       |
|--------------------|--------------------|------------------------------|
| name               | string             | null: false                  |
| text               | text               | null: false                  |
| category_id        | integer            | null: false                  |
| status_id          | integer            | null: false                  |
| shippingCharge_id  | integer            | null: false                  |
| shippingDay_id     | integer            | null: false                  |
| price              | integer            | null: false, 300~9,999,999   |

### Association

- belongs_to :user
- has_many :comments
- has_one :purchaseInformation
- belongs_to :category
- belongs_to :status
- belongs_to :shippingCharge
- belongs_to :shippingDay


## purchaseInformationDates

| Column             | Type            | Option                        |
|--------------------|-----------------|-------------------------------|
| user               | references      | null:false, foreign_key: true |
| item               | references      | null:false, foreign_key: true |
| postNum            | string          | null:false, ハイフン必須        |
| prefectures_id     | integer         | null: false                   |
| municipality       | string          | null: false                   |
| address            | string          | null: false                   |
| billName           | string          |                               |
| phoneNum           | integer         | null: false,11桁              |


### Association

- belongs_to :user
- belongs_to :item


## comments

| Column             | Type            | Option                        |
|--------------------|-----------------|-------------------------------|
| user               | references      | null:false, foreign_key: true |
| item               | references      | null:false, foreign_key: true |
| text               | text            | null:false                    |

### Association

- belongs_to :user
- belongs_to :item