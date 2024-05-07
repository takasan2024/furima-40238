class CreateAddressInformations < ActiveRecord::Migration[7.0]
  def change
    create_table :address_informations do |t|
      t.string     :post_code,   null: false
      t.integer    :shopping_area_id,    null: false
      t.string     :municipalities, null: false
      t.string     :street_address, null: false
      t.string     :building_name
      t.string     :telephone_number, null: false
      t.references :buyer,      null: false, foreign_key: true
      t.timestamps
    end
  end
end
