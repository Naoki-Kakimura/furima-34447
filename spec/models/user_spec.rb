require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe '#create' do
    context 'ユーザーが登録できるとき' do
      it 'Userモデルのカラムに正常な値が入れば保存される' do
        expect(@user).to be_valid
      end
    end
    
    context 'ユーザーが登録ができないとき' do
      it 'nameが空では保存できない' do
        @user.name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Name can't be blank")
      end
      it 'emailが空では保存できない' do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'emailが既に登録済みの値であれば保存できない' do
        @user.save
        test_user = FactoryBot.build(:user)
        test_user.email = @user.email
        test_user.valid?
        expect(test_user.errors.full_messages).to include("Email has already been taken")
      end
      it 'emailに@がなければ保存できない' do
        @user.email = "hogehoge"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it 'passwordが空では保存できない' do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが数字のみでは保存できない' do
        @user.password = "11111111"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password 英字と数字の両方を含めて設定してください")
      end
      it 'passwordが英語のみでは保存できない' do
        @user.password = "aaaaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password 英字と数字の両方を含めて設定してください")
      end
      it 'passwordが全角では保存できない' do
        @user.password = "あいうえおかき"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password 英字と数字の両方を含めて設定してください")
      end
      it 'passwordが６文字以上でないと保存されない' do
        @user.password = "11aa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it 'first_name_kanが空では保存できない' do
        @user.first_name_kan = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kan can't be blank")
      end
      it 'first_name_kanが全角文字でないと保存されない' do
        @user.first_name_kan = "yamada"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kan 全角文字を使用してください")
      end
      it 'last_name_kanが空では保存されない' do
        @user.last_name_kan = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kan can't be blank")
      end
      it 'last_name_kanが全角文字でないと保存されない' do
        @user.last_name_kan = "taro"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kan 全角文字を使用してください")
      end
      it 'first_name_kataが空であれば保存されない' do
        @user.first_name_kata = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kata can't be blank")
      end
      it 'first_name_kataが全角ひらがなでは保存されない' do
        @user.first_name_kata = "やまだ"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kata 全角カタカナを使用してください")
      end
      it 'first_name_kataが全角漢字では保存されない' do
        @user.first_name_kata = "山田"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kata 全角カタカナを使用してください")
      end
      it 'first_name_kataが半角では保存されない' do
        @user.first_name_kata = "yamada"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kata 全角カタカナを使用してください")
      end
      it 'last_name_kataが空であれば保存されない' do
        @user.last_name_kata = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kata can't be blank")
      end
      it 'last_name_kataが全角ひらがなでは保存されない' do
        @user.last_name_kata = "たろう"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kata 全角カタカナを使用してください")
      end
      it 'last_name_kataが全角漢字では保存されない' do
        @user.last_name_kata = "太郎"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kata 全角カタカナを使用してください")
      end
      it 'last_name_kataが半角では保存されない' do
        @user.last_name_kata = "tarou"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kata 全角カタカナを使用してください")
      end
      it 'birthdayが空では保存できない' do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
