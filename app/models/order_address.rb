class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :address, :prefecture_id, :city, :streetad, :building, :phone_number, :token


# バリデーション
with_options presence: true do

  #郵便番号は、「3桁ハイフン4桁」の半角文字列のみ
  validates :address, format: { with: /\A\d{3}-\d{4}\z/, message: "は無効な形式です。正しい形式は '123-4567' です。" }
  
  #都道府県が必須
  validates :prefecture_id, numericality: { other_than: 0 } 


  #市区町村が必須
  validates :city

  #番地が必須
  validates :streetad

  #電話番号は、10桁以上11桁以内の半角数値のみ
  validates :phone_number, format: { with: /\A\d{10,11}\z/, message: "は無効な形式です。10桁または11桁の半角数値を入力してください。" }

  #token
  validates :token

  #item
  validates :item_id

  #user
  validates :user_id

end

# saveメソッド
def save
  # 情報を保存し、変数orderに代入する
  order = Order.create(item_id: item_id, user_id: user_id)
  # 住所を保存する
  Address.create(address: address, prefecture_id: prefecture_id, city: city, streetad: streetad, building: building, phone_number: phone_number,order_id: order.id)
end
 
end
