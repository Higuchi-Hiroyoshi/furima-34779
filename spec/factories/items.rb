FactoryBot.define do
  factory :item do
    association :user
    product_name           { Faker::Lorem.word }
    description_of_item    { Faker::Lorem.word }
    category_id            { Faker::Number.between(from: 2, to: 20) }
    product_condition_id   { Faker::Number.between(from: 2, to: 7) }
    shipping_fee_id        { Faker::Number.between(from: 2, to: 3) }
    shipping_area_id       { Faker::Number.between(from: 2, to: 48) }
    date_of_shipment_id    { Faker::Number.between(from: 2, to: 4) }
    price                  { Faker::Number.between(from: 0, to: 10_000_000) }

    after(:build) do |item|
      item.image.attach(io: File.open('app/assets/images/item-sample.png'), filename: 'item-sample.png')
    end
  end
end
