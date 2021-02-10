class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  with_options presence: true do
    validates :name
    validates :category_id
    validates :text
    validates :status_id
    validates :shipping_charge_id
    validates :shipping_day_id
    validates :prefectures_id
  end

  VALID_PRICE_REGEX = /\A[0-9]+\z/
  with_options presence: true, numericality: {greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999},
  format:{with:VALID_PRICE_REGEX, message: "半角英数字で¥300~¥9,999,999の間で記入してください"} do
    validates :price
  end
end
