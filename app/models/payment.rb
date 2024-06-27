# frozen_string_literal: true

class Payment < ApplicationRecord
  belongs_to :order

  before_save :set_payment_amount

  after_commit :send_notification

  private

  def set_payment_amount
    self.amount = order.total_price
  end

  def send_notification
    OrderMailer.order_notification(order).deliver_later
  end
end
