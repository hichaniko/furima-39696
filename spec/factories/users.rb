FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.email}
    password              {"1127hitomi"+Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    name_last_name {"お"}
    name_first_name {"か"}
    name_last_name_kana {"オ"}
    name_first_name_kana {"カ"}
    birthday {"1930-01-01"}

  end
end