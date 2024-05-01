class Item < ApplicationRecord
 
  belongs_to :user
  has_one :address_information
  has_one_attached :image
  
  with_options presence: true, format: { with: /\A[0-9]+\z/ } do
  validates:price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: "can't be blank"}
  end
    
    
    validates :category_id, numericality: {other_than: 1, message: "can't be blank" }
    validates :situation_id, numericality: {other_than: 1, message: "can't be blank" }
    validates :delivery_charge_id, numericality: {other_than: 1, message: "can't be blank" }
    validates :shopping_area_id, numericality: {other_than: 1, message: "can't be blank" }
    validates :number_of_days_until_shopping_id, numericality: {other_than: 1, message: "can't be blank" }
 
    validates :image,:name, :explanation,:price, presence: true
 
 extend ActiveHash::Associations::ActiveRecordExtensions 
 belongs_to :category
 belongs_to :situation
 belongs_to :delivery_charge
 belongs_to :shopping_area
 belongs_to :number_of_days_until_shopping


end

