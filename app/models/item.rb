class Item < ApplicationRecord

  belongs_to :user
  has_one :buyer
  has_one_attached :image
  
  validates :price, numericality: {only_integer: true, message: 'Half-width number'}, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is out of setting range"}
    
    
    validates :category_id, numericality: {other_than: 1, message: "can't be blank" }
    validates :situation_id, numericality: {other_than: 1, message: "can't be blank" }
    validates :delivery_charge_id, numericality: {other_than: 1, message: "can't be blank" }
    validates :shopping_area_id, numericality: {other_than: 1, message: "can't be blank" }
    validates :number_of_days_until_shopping_id, numericality: {other_than: 1, message: "can't be blank" }
 
    validates :image,:name, :explanation, presence: true
 
 extend ActiveHash::Associations::ActiveRecordExtensions 
 belongs_to :category
 belongs_to :situation
 belongs_to :delivery_charge
 belongs_to :shopping_area
 belongs_to :number_of_days_until_shopping


end

