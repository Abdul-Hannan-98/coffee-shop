# frozen_string_literal: true

class ItemsController < ApplicationController
  before_action :set_item, only: :update

  def index
    render json: Item.where.not(quantity_avaliable: 0)
  end

  def update
    if @item.update(item_params)
      render json: @item, status: :created
    else
      render json: @item.errors, status: :unprocessable_entity
    end
  end

  private

  def set_item
    @item = Item.find_by(id: params[:id])
    return if @item.present?

    render json: 'Item not found', status: :unprocessable_entity
  end

  def item_params
    params.require(:item).permit(:quantity_avaliable)
  end
end
