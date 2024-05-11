class BuyerAddressInformation
  include ActiveModel::Model
  attr_accessor :user_id,:item_id,:post_code,:shopping_area_id,:municipalities,:street_address,:building_name,:telephone_number,:token
  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :municipalities
    validates :street_address
    validates :telephone_number , format: { with: /\A[0-9]{10,11}\z/, message: 'is invalid' }
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :shopping_area_id, numericality: {other_than: 1, message: "can't be blank"}
    validates :token
  end
  
  def save(params,user_id)
    buyer = Buyer.create(item_id: params[item_id],user_id: user_id)
    AddressInformation.create(post_code: post_code, shopping_area_id: shopping_area_id, municipalities: municipalities, street_address: street_address, building_name: building_name, telephone_number: telephone_number, buyer_id: buyer.id)
  end
end