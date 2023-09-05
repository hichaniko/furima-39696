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
      @item.selling_price = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Selling price Out of setting range")
    end

    it 'userが空では登録できない' do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("User must exist")
    end
  end
  end
end

