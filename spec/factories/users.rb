FactoryBot.define do
  factory :user do
    nick_name              { 'test' }
    email                  { 'test@example' }
    password               { '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation  { password }
    first_name             { 'あ' }
    last_name              { 'い' }
    first_name_kana        { 'ア' }
    last_name_kana         { 'イ' }
    birthday               { '1999-12-31' }
  end
end
