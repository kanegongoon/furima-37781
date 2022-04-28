FactoryBot.define do
  factory :purchase_record_address do
    postal_code     {'000-0000'}
    prefecture_id   {'1'}
    city            {'横浜市'}
    house_number    {'八景島'}
    building_name   {'シーパラダイス'}
    phone_number    {'09012345678'}
  end
end
