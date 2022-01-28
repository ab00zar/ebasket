# frozen_string_literal: true

module Discounts
  class DiscountedPriceService
    def initialize(item, basket_item)
      @item = item
      @basket_item = basket_item
    end

    def call
      {
        'buy1get1' => buy1get1,
        'buy3get0.5' => buy3wins50cents,
        'buy3pay2/3' => buy3paytwothirds
      }.fetch(discount.name)
    end

    private

    def discount
      @item.discount
    end

    def general_price
      @basket_item.final_price + @item.price
    end

    def buy1get1
      @basket_item.quantity.even? ? @basket_item.final_price : general_price
    end

    def buy3wins50cents
      @basket_item.quantity >= 3 ? (@basket_item.quantity * (@item.price - 0.5)) : general_price
    end

    def buy3paytwothirds
      @basket_item.quantity >= 3 ? (@basket_item.quantity * (2.0/3.0) * @item.price) : general_price
    end
  end
end
