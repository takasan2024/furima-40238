FactoryBot.define do
  factory :buyer_address_information do  
    post_code { '123-4567' }
    shopping_area_id { 2 }
    municipalities { '東京都' }
    street_address { '1-1' }
    building_name { '東京ハイツ' }
    telephone_number { '09011119099' }
    token {"tok_abcdefghijk00000000000000000"}
  end
end
