

## users

| users                   | Type      | option                    |
|-------------------------|-----------|---------------------------|
| nickname                | string    | null: false               |
| email                   | string    | null: false               |
| password                | string    | null: false               |
| password_confirmation   | string    | null: false               |
| firstNameKan            | string    | null: false,全角のみ       |
| lastNameKan             | string    | null: false,全角のみ       |
| firstNameKata           | string    | null: false,全角カタカナのみ |
| lastNameKata            | string    | null: false,全角カタカナのみ |
| birthdayY               | integer   | null: false               |
| birthdayM               | integer   | null: false               |
| birthdayD               | integer   | null: false               |

### Association

- has_many :items
- has_many :comments
- has_many :purchaseHistory


## items

| items           | Type               | option                       |
|-----------------|--------------------|------------------------------|
| image           | ActiveStorageで実装 | null: false                  |
| name            | string             | null: false                  |
| text            | text               | null: false                  |
| category        | string             | null: false                  |
| status          | sting              | null: false                  |
| shippingCharge  | string             | null: false                  |
| shippingDay     | string             | null: false                  |
| price           | integer            | null: false, 300~9,999,999   |

### Association

- belongs_to :user
- has_many :comments
- has_one :purchaseHistory


## purchaseHistories

| items       | Type       | option                         |
|-------------|------------|--------------------------------|
| user_id     | references | null: false , foreign_key: true|
| item_id     | references | null: false , foreign_key: true|
| credit_id   | references | null: false , foreign_key: true|
| address_id  | references | null: false , foreign_key: true|

### Association

- belongs_to :user
- belongs_to :item
- has_one :credit_id
- has_one :address_id


## credits

| items              | Type       | option                         |
|--------------------|------------|--------------------------------|
| purchaseHistory_id | references | null: false, foreign_key: true |
| num                | integer    | null: false                    |
| expirationDateY    | integer    | null: false                    |
| expirationDateM    | integer    | null: false                    |
| expirationDateD    | integer    | null: false                    |
| securityCode       | integer    | null: false                    |

### Association

- belongs_to: purchaseHistory


## addresses

| items              | Type       | option                         |
|--------------------|------------|--------------------------------|
| purchaseHistory_id | references | null: false, foreign_key: true |
| postNum            | integer    | null: false, ハイフンが必要      |
| prefectures        | string     | null: false                    |
| municipality       | string     | null: false                    |
| address            | string     | null: false                    |
| phoneNum           | integer    | null: false, 11桁まで           |

### Association

- belongs_to: purchaseHistory