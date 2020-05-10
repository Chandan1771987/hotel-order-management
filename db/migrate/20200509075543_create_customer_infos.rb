class CreateCustomerInfos < ActiveRecord::Migration[6.0]
  def change
    create_table :customer_infos do |t|
      t.string :name
      t.string :last_name
      t.string :house_no
      t.string :street
      t.string :area
      t.string :city
      t.string :state
      t.string :pincode
      t.string :landmark
      t.string :email
      t.string :phone_no

      t.timestamps
    end
  end
end
