FactoryBot.define do
  factory :item do
    association :user
    name                {'サンプル'}
    explanation         {'サンプルの画像です'}
    category_id         {'2'}
    condition_id        {'2'}
    shipping_charges_id {'2'}
    prefecture_id       {'1'}
    shipping_day_id     {'2'}
    price               {'1000'}

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
