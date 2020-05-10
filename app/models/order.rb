class Order < ApplicationRecord
  belongs_to :menu_item
  belongs_to :customer_info, foreign_key: :customer_id
  has_one :order_payment_info
  has_one :order_delivery_info

  after_create :create_order_payment_info
  after_create :create_order_delivery_info

  KEYS = [:quantity, :order_placed_type]

  IN_PERSON = 'in_person'
  ONLINE = 'online'


  def price
    @price ||= (menu_item.price).to_i * quantity
  end

  def self.create_order(params: )
    customer = CustomerInfo.create_customer(params: params)
    create_params = HashWithIndifferentAccess.new
    KEYS.each do |key|
      create_params[key] = params[key]
    end
    create_params = create_params.merge(menu_item_id: params[:menu_item_id], customer_id: customer.id)
    @order = Order.create!(create_params)
  end

  def create_order_payment_info
    OrderPaymentInfo.create!(order_id: self.id, payment_type: self.order_placed_type.presence || ONLINE)
  end

  def create_order_delivery_info
    OrderDeliveryInfo.create!(order_id: self.id)
  end

  def payment_info
    @payment_info ||= OrderPaymentInfo.find_by_order_id self.id
  end

  def delivery_info
    @delivery_info ||= OrderDeliveryInfo.find_by_order_id self.id
  end
end
