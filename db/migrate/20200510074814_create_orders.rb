class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.integer :menu_item_id
      t.integer :quantity
      t.string :order_placed_type
      t.integer :customer_id

      t.timestamps
    end
  end
end
