FactoryBot.define do
  factory :user do
    nickname              {'sample'}
    email                 {Faker::Internet.free_email}
    password              {'000aaa'}
    password_confirmation {password}
    first_name            {'太郎'}
    last_name             {'山田'}
    first_name_kana       {'タロウ'}
    last_name_kana        {'ヤマダ'}
    birthday              {'2000/01/01'}
  end
end