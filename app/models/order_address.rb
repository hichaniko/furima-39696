class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :address, :prefecture_id, :city, :streetad, :building, :phone_number, :token

# バリデーション
  #郵便番号が必須　　
  validates :address, presence: true

  #郵便番号は、「3桁ハイフン4桁」の半角文字列のみ
  validates :address, presence: true, format: { with: /\A\d{3}-\d{4}\z/, message: "は無効な形式です。正しい形式は '123-4567' です。" }
  
  #都道府県が必須
  validates :prefecture_id, presence: true

  #市区町村が必須
  validates :city, presence: true

  #番地が必須
  validates :streetad, presence: true

  #電話番号が必須
  validates :phone_number, presence: true

  #電話番号は、10桁以上11桁以内の半角数値のみ
  validates :phone_number, presence: true, format: { with: /\A\d{10,11}\z/, message: "は無効な形式です。10桁または11桁の半角数値を入力してください。" }


# saveメソッド
def save
  # 情報を保存し、変数orderに代入する
  order = Order.create(item_id: item_id, user_id: user_id)
  # 住所を保存する
  Address.create(address: address, prefecture_id: prefecture_id, city: city, streetad: streetad, building: building, phone_number: phone_number,order_id: order.id)
end
 
end
