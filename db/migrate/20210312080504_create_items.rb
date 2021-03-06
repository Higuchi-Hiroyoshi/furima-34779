class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :product_name,                   null: false
      t.integer :price,                        null: false
      t.text :description_of_item,              null: false
      t.references :user,                       foregin_key: true
      t.integer :category_id,                  null: false
      t.integer :product_condition_id,         null: false
      t.integer :shipping_fee_id,              null: false
      t.integer :shipping_area_id,             null: false
      t.integer :date_of_shipment_id,          null: false

      t.timestamps
    end
  end
end
