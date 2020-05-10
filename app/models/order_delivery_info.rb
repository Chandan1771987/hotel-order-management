class OrderDeliveryInfo < ApplicationRecord
  belongs_to :order
  before_save :set_status
  PENDING = 'pending'
  DELIVERED = 'delivered'
  FAILED = 'delivery_failed'

  def set_status
    self.status = PENDING if self.status.blank?
  end
end
