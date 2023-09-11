require 'rails_helper'

RSpec.describe OrderAddress, type: :model do

  describe '商品購入' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order_address = FactoryBot.build(:order_address, user_id: user.id,item_id:item.id)
    end

    
      context '新規登録できるとき' do
        it '情報が存在すれば登録できる' do
         expect(@order_address).to be_valid
        end

        it'建物名が空でも登録できる' do
          @order_address.building = ''
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

        it'都道府県に「---」が選択されている場合は購入できない' do
          @order_address.prefecture_id = 0
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Prefecture must be other than 0")
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

        it '電話番号は、9桁以下では購入できない' do
          @order_address.phone_number = '123456789'
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Phone number は無効な形式です。10桁または11桁の半角数値を入力してください。")
        end

        it '電話番号は、12桁以上では購入できない' do
          @order_address.phone_number = '1234567890123'
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Phone number は無効な形式です。10桁または11桁の半角数値を入力してください。")
        end

        it '電話番号は、半角数字以外が含まれている場合は購入できない' do
          @order_address.phone_number = '１２３'
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Phone number は無効な形式です。10桁または11桁の半角数値を入力してください。")
        end

        it 'tokenが空では購入できない' do
          @order_address.token = ''
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Token can't be blank")
        end
        
        it 'userが紐付いていなければ購入できない' do
          @order_address.user_id = ''
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("User can't be blank")
        end

        it 'itemが紐付いていなければ購入できない' do
          @order_address.item_id = ''
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Item can't be blank")
        end
        


      end
  end
end