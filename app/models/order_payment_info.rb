class OrderPaymentInfo < ApplicationRecord
  belongs_to :order
  before_save :set_status

  PENDING = 'pending'
  PAID = 'paid'
  FAILED = 'failed'

  def set_status
    self.status = PENDING if self.status.blank?
  end
end
