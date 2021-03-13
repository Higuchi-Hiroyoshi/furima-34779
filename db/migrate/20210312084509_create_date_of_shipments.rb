class CreateDateOfShipments < ActiveRecord::Migration[6.0]
  def change
    create_table :date_of_shipments do |t|

      t.timestamps
    end
  end
end
