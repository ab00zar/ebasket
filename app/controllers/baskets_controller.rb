# frozen_string_literal: true

class BasketsController < ApplicationController
  before_action :set_basket, only: %i[show reset]

  def show
    @basket_items = @basket.basket_items.order(updated_at: :asc)
  end

  def reset
    @basket.update(price: 0, final_price: 0)
    BasketItem.delete_all
    respond_to do |format|
      format.html { redirect_to my_basket_path, notice: 'Reset is done!' }
    end
  end

  private

  def set_basket
    @basket = Basket.first
  end
end
