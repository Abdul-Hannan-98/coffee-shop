# frozen_string_literal: true

class OrderMailer < ApplicationMailer
  def order_notification(order)
    @order = order
    mail(to: @order.user.email, subject: 'Your Order Notification')
  end
end
