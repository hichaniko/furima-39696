require 'rails_helper'

RSpec.describe OrderAddress, type: :model do

  describe '商品購入' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order_address = FactoryBot.build(:order_address, user_id: user.id)
    end

    
      context '新規登録できるとき' do
        it '情報が存在すれば登録できる' do
         expect(@order_address).to be_valid
        end
      end

      context '購入できないとき' do
        it 'addressが空では登録できない' do
          @order_address.address = ''
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Address can't be blank")
        end

        it 'addressが「3桁ハイフン4桁」の半角文字列以外登録できない' do
          @order_address.address = '1234567'
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Address は無効な形式です。正しい形式は '123-4567' です。")
        end

        it '市区町村が空では登録できない' do
          @order_address.city = ''
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("City can't be blank")
        end

        it '番地が空では登録できない' do
          @order_address.streetad = ''
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Streetad can't be blank")
        end

        it '電話番号が空では登録できない' do
          @order_address.phone_number = ''
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
        end

        it '電話番号は、10桁以上11桁以内の半角数値以外登録できない' do
          @order_address.phone_number = ''
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
        end

      end
  end
end