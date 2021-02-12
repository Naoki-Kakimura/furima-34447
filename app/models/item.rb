class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_one :order
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :shipping_day
  belongs_to :shipping_charge
  belongs_to :prefecture
  belongs_to :status

  with_options presence: true do
    validates :name, length: {maximum:40}
    validates :text, length: {maximum:1000}
    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :status_id
      validates :shipping_charge_id
      validates :shipping_day_id
      validates :prefecture_id
    end

  end

  VALID_PRICE_REGEX = /\A[0-9]+\z/
  with_options presence: true, numericality: {greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999},
  format:{with:VALID_PRICE_REGEX, message: '半角英数字で¥300~¥9,999,999の間で記入してください'} do
    validates :price
  end

  validate :validate_image

  private
   def validate_image
    if image.attached?
    else
      errors.add(:image, "写真ファイルを添付してください")
    end
   end
end
