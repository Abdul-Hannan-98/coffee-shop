# frozen_string_literal: true

class OrdersController < ApplicationController
  def create
    @order = Order.new(order_params)
    if @order.save
      render json: @order, status: :created
    else
      render json: @order.errors, status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.require(:order).permit(:user_id, order_items_attributes: %i[item_id quantity])
  end
end
