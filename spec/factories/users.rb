FactoryBot.define do
  factory :user do
    name                {Faker::Name.name}
    email               {Faker::Internet.free_email}
    password            {Faker::Alphanumeric.alphanumeric(number: 10, min_alpha: 3, min_numeric: 3)}
    first_name_kan      {'山田'}
    last_name_kan       {'太郎'}
    first_name_kata     {'ヤマダ'}
    last_name_kata      {'タロウ'}
    birthday            {Faker::Date.in_date_period}
  end
end