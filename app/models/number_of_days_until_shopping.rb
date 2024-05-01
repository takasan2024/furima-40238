class NumberOfDaysUntilShopping < ActiveHash::Base
  self.data = [
    { id: 1, number_of_days_until_shopping: '---' },
    { id: 2, number_of_days_until_shopping: '１～２日で発送' },
    { id: 3, number_of_days_until_shopping: '２～３日で発送' },
    { id: 4, number_of_days_until_shopping: '４～７日で発送' },
  ]
  include ActiveHash::Associations
  has_many :items
  
  end