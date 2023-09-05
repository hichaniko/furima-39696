FactoryBot.define do
  factory :item do
    productname {"Sanple Product"}
    explanation {"This is a sample product description."}
    category_id {2}
    condition_id {2}
    derivary_charge_id {2}
    prefecture_id {2}
    delivery_day_id {2}
    selling_price {300}
    association :user
  

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
