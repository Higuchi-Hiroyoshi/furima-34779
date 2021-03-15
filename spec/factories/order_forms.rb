FactoryBot.define do
  factory :order_form do
    token                  { 'tok_abcdefghijk00000000000000000' }
    zip_code               { '000-0000' }
    shipping_area_id       { 2 }
    city                   { 'あ' }
    street_address         { 'あ' }
    building               { 'あ' }
    phone_number           { '0' }
    association :user
    association :item
  end
end
