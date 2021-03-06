# frozen_string_literal: true

module Items
  class PriceCalculatorService
    def initialize(item, basket_item)
      @item = item
      @basket_item = basket_item
    end

    def call
      {
        final_price: final_price,
        price: general_price
      }
    end

    private

    def final_price(discounted_price_service: Discounts::DiscountedPriceService)
      @item.discount.present? ? discounted_price_service.new(@item, @basket_item).call : general_price
    end

    def general_price
      @basket_item.quantity * @item.price
    end
  end
end
