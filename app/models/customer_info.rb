class CustomerInfo < ApplicationRecord

  KEYS = [:name, :last_name, :house_no, :street, :area, :city, :state, :pincode, :landmark, :email, :phone_no]

  def self.create_customer(params: )
    customer_params = HashWithIndifferentAccess.new
    KEYS.each do |key|
      customer_params[key] = params[key]
    end
    CustomerInfo.create!(customer_params)
  end

end
