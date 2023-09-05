require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の情報を入力' do
    context '商品出品ができる時' do
    it '全ての項目が正しく存在すれば出品できる' do
      expect(@item).to be_valid
    end
   end

  context '商品画像がない時' do
    it 'imageが空では登録できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it 'productnameが空では登録できない' do
      @item.productname = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Productname can't be blank")
    end

    it 'explanationが空では登録できない' do
      @item.explanation = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Explanation can't be blank")
    end

    it 'category_idが空では登録できない' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Category must be other than 1")
    end

    it 'condition_idが空では登録できない' do
      @item.condition_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Condition must be other than 1")
    end


    it 'derivary_charge_idが空では登録できない' do
      @item.derivary_charge_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Derivary charge must be other than 1")
    end

    it 'prefecture_idが空では登録できない' do
      @item.prefecture_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture must be other than 0")
    end

    it 'delivery_day_idが空では登録できない' do
      @item.delivery_day_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery day must be other than 1")
    end

    it 'selling_priceが空では登録できない' do
      @item.selling_price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Selling price is not a number")
    end

    it 'selling_priceに半角数字以外が含まれている場合は出品できない' do
      @item.selling_price = "あいう"
      @item.valid?
      expect(@item.errors.full_messages).to include("Selling price is not a number")
    end

    it 'selling_priceが300円未満では出品できない' do
      @item.selling_price = 200
      @item.valid?
      expect(@item.errors.full_messages).to include("Selling price must be greater than or equal to 300")
    end

    it 'selling_priceが9_999_999円を超えると出品できない' do
      @item.selling_price = 100_000_000
      @item.valid?
      expect(@item.errors.full_messages).to include("Selling price must be less than or equal to 9999999")
    end

    it 'userが空では登録できない' do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("User must exist")
    end
  end
  end
end

