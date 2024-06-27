# frozen_string_literal: true

class PaymentsController < ApplicationController
  def create
    @payment = Payment.new(payment_params)
    if @payment.save
      render json: @payment, status: :created
    else
      render json: @payment.errors, status: :unprocessable_entity
    end
  end

  private

  def payment_params
    params.require(:payment).permit(:order_id)
  end
end
