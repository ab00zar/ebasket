# frozen_string_literal: true

module Baskets
  class UpdatePriceService
    def initialize(basket)
      @basket = basket
    end

    def call
      @basket.update({
                       price: summation(:price),
                       final_price: summation(:final_price)
                     })
    end

    private

    def summation(attribute)
      @basket.basket_items.sum(attribute)
    end
  end
end
