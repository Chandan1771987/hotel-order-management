class CreateOrderDeliveryInfos < ActiveRecord::Migration[6.0]
  def change
    create_table :order_delivery_infos do |t|
      t.integer :order_id
      t.string :status

      t.timestamps
    end
  end
end
