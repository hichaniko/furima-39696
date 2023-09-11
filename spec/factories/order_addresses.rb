FactoryBot.define do
  factory :order_address do
    address{'123-4567'}
    prefecture_id{'東京都'}
    city {'中央区'}
    streetad {'銀座'}
    building {'ビル'}
    phone_number {'09012345678'}
    token {'tok_abcdefghijk00000000000000000'}
  end
end
