# frozen_string_literal: true

class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items, dependent: :destroy
  has_many :items, through: :order_items

  accepts_nested_attributes_for :order_items

  before_save :calculate_pricing

  private

  def calculate_pricing
    final_price = 0
    order_items.each do |order_item|
      final_price += order_item.item.calculated_price(order_item.quantity)
    end

    self.total_price = final_price
  end
end
