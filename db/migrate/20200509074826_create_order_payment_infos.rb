class CreateOrderPaymentInfos < ActiveRecord::Migration[6.0]
  def change
    create_table :order_payment_infos do |t|
      t.integer :order_id
      t.string :status
      t.string :payment_type
      t.string :transaction_id

      t.timestamps
    end
  end
end
