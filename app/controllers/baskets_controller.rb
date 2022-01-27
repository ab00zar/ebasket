# frozen_string_literal: true

class BasketsController < ApplicationController
  before_action :set_basket, only: %i[show]

  def show
    @basket_items = @basket.basket_items
  end

  private

  def set_basket
    @basket = current_user.basket
  end
end
