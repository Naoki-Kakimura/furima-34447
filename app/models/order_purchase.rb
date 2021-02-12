class OrderPurchase
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_num, :prefecture_id, :municipality, :address, :bill_name, :phone_num, :order_id,:token

  with_options presence:true do
    validates :user_id
    validates :item_id
    validates :token
  end
  with_options presence:true do
    validates :post_num,format:{with:/\A[0-9]{3}-[0-9]{4}\z/ ,message:'半角英数字で-(ハイフン)をつけて記入して下さい'}
    validates :prefecture_id,numericality: { other_than: 1 }
    validates :phone_num, length: {maximum:11},format:{with:/\A[0-9０-９]+\z/ ,message:'11桁以内の数値のみで記入して下さい'}
    validates :municipality
    validates :address
  end

  def save
    order = Order.create(item_id: item_id, user_id: user_id,token: token)
    PurchaseInformation.create(post_num: post_num, prefecture_id: prefecture_id, municipality: municipality, address: address, bill_name: bill_name, phone_num: phone_num, order_id: order.id)
  end
end