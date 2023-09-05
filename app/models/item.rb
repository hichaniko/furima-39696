class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :derivary_charge
  belongs_to :prefecture
  belongs_to :delivery_day

    #空の投稿を保存できないようにする
    validates :productname, :explanation, :category_id, :condition_id, :derivary_charge_id,:prefecture_id, :delivery_day_id, presence: true
  
    #ジャンルの選択が「---」の時は保存できないようにする
    validates :category_id, :condition_id, :derivary_charge_id,  :delivery_day_id, numericality: { other_than: 1 } 
    validates :prefecture_id, numericality: { other_than: 0 } 
    
    #商品画像を1枚つけることが必須
    validates :image, presence: true

    #金額の範囲指定
    validates :selling_price, numericality: { only_integer: true },numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }


end
