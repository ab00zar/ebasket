# frozen_string_literal: true

module Discounts
  class DiscountedPriceService
    def call(item, basket_item)
      discount = Discount.find(item.discount_id)

      {
        'buy1get1' => buy1get1(item, basket_item),
        'buy3get0.5' => buy3wins50cents(item, basket_item),
        'buy3pay2/3' => buy3paytwothirds(item, basket_item)
      }.fetch(discount.name)
    end

    private

    def normal_price(item, basket_item)
      basket_item.final_price + item.price
    end

    def buy1get1(item, basket_item)
      basket_item.quantity.even? ? basket_item.final_price : normal_price(item, basket_item)
    end

    def buy3wins50cents(item, basket_item)
      basket_item.quantity >= 3 ? (basket_item.quantity * (item.price - 0.5)) : normal_price(item, basket_item)
    end

    def buy3paytwothirds(item, basket_item)
      basket_item.quantity >= 3 ? (basket_item.quantity * 0.66 * item.price) : normal_price(item, basket_item)
    end
  end
end
