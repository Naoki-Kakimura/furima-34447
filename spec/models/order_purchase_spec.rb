require 'rails_helper'

RSpec.describe OrderPurchase, type: :model do
  describe '商品購入情報の保存' do
      before do
        user = FactoryBot.create(:user)
        item = FactoryBot.create(:item)
        @order_purchase = FactoryBot.build(:order_purchase,user_id: user.id,item_id: item.id)
        sleep(1)
      end
      context 'すべての値が正しく入力されていれば保存できること' do
        it 'すべての値が正しく入力されていればOrder・Purchase_infomationに保存できること' do
          expect(@order_purchase).to be_valid
        end
        it '建物名が空でも保存されること' do
          @order_purchase.bill_name = ""
          expect(@order_purchase).to be_valid
        end
      end
      context '値が正しくない場合は保存されないこと' do
        it 'クレジットカードの入力が正しくないと保存されないこと' do
          @order_purchase.token = nil
          @order_purchase.valid?
          expect(@order_purchase.errors.full_messages).to include("Token can't be blank")
        end
        it '郵便番号の保存にはハイフンが必要であること' do
          @order_purchase.post_num = "1234567"
          @order_purchase.valid?
          expect(@order_purchase.errors.full_messages).to include("Post num 半角英数字で-(ハイフン)をつけて記入して下さい")
        end
        it '郵便番号の保存にはハイフンの前後に3桁・4桁の半角英数字が必要であること' do
          @order_purchase.post_num = "12-67"
          @order_purchase.valid?
          expect(@order_purchase.errors.full_messages).to include("Post num 半角英数字で-(ハイフン)をつけて記入して下さい")
        end
        it '発送先住所の都道府県の選択は必須であること' do
          @order_purchase.prefecture_id = 1
          @order_purchase.valid?
          expect(@order_purchase.errors.full_messages).to include("Prefecture must be other than 1")
        end
        it '電話番号が空では保存されないこと' do
          @order_purchase.phone_num = ""
          @order_purchase.valid?
          expect(@order_purchase.errors.full_messages).to include("Phone num can't be blank")
        end
        it '電話番号が11桁以上では保存されないこと' do
          @order_purchase.phone_num = "1111111111111"
          @order_purchase.valid?
          expect(@order_purchase.errors.full_messages).to include("Phone num is too long (maximum is 11 characters)")
        end
        it '電話番号が数値以外では保存されないこと' do
          @order_purchase.phone_num = "あいうえおかきく"
          @order_purchase.valid?
          expect(@order_purchase.errors.full_messages).to include("Phone num 11桁以内の数値のみで記入して下さい")
        end
        it '市区町村が空では保存されないこと' do
          @order_purchase.municipality = ""
          @order_purchase.valid?
          expect(@order_purchase.errors.full_messages).to include("Municipality can't be blank")
        end
        it '番地が空では保存されないこと' do
          @order_purchase.address = ""
          @order_purchase.valid?
          expect(@order_purchase.errors.full_messages).to include("Address can't be blank")
        end
      end
  end
end
