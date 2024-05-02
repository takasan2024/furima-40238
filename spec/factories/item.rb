FactoryBot.define do
  factory :item do
    image { Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/IMG_0171.JPEG'), 'image/jpeg')}
    name {'パソコン'}
    explanation  {'3年前に購入したMacBookです'}
    category_id {2}
    situation_id {2}
    delivery_charge_id {2}
    shopping_area_id {2}
    number_of_days_until_shopping_id {2}
    price {50000}

    association :user

  end
end
