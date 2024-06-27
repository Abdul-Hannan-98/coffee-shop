# frozen_string_literal: true

class Item < ApplicationRecord
  has_many :order_items
  has_many :orders, through: :order_items

  def calculated_price(quantity = 1)
    base_price = price * quantity
    base_price -= ((base_price / 100) * discount_rate) unless discount_rate.zero?
    base_price + ((base_price / 100) * tax_rate) unless tax_rate.zero?
    base_price
  end
end
