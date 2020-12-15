require 'rails_helper'

RSpec.describe UserOrder, type: :model do
  describe '購入情報の保存' do
    before do
      @user_order = FactoryBot.build(:user_order)
    end

    context '保存がうまくいくとき' do
      it '正常に記入すると保存できる' do
        expect(@user_order).to be_valid
      end
      it '建物名がなくても保存できる' do
        @user_order.building_name = nil
        expect(@user_order).to be_valid
      end
    end

    context '保存がうまくいかないとき' do
      it 'クレジットカード情報が正しくないと保存できない' do
        @user_order.token = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Token can't be blank")
      end

      it '郵便番号が空欄だと保存できない' do
        @user_order.post_number = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Post number can't be blank")
      end

      it '郵便番号は-無しだと保存できない' do
        @user_order.post_number = '1234567'
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include('Post number is invalid. Include hyphen(-)')
      end

      it '郵便番号は全角数字だと保存できない' do
        @user_order.post_number = '０１２-１２３４'
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include('Post number is invalid. Include hyphen(-)')
      end

      it '都道府県が空欄だと保存できない' do
        @user_order.prefecture_id = 0
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Prefecture can't be blank")
      end

      it '市区町村が空欄だと保存できない' do
        @user_order.city = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("City can't be blank")
      end

      it '番地が空欄だと保存できない' do
        @user_order.house_number = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("House number can't be blank")
      end

      it '電話番号が空欄だと保存できない' do
        @user_order.telephone_number = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Telephone number can't be blank")
      end

      it '電話番号は-ありだと保存できない' do
        @user_order.telephone_number = '080-1234-5678'
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include('Telephone number is too long (maximum is 11 characters)')
      end

      it '電話番号は12桁以上だと保存できない' do
        @user_order.telephone_number = '080123456789'
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include('Telephone number is too long (maximum is 11 characters)')
      end

      it '電話番号は全角数字だと保存できない' do
        @user_order.telephone_number = '０８０１２３４５６７８'
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include('Telephone number is invalid. Input full-width numbers.')
      end
    end
  end
end
