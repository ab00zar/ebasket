# frozen_string_literal: true

module Items
  class PriceCalculatorService
    def call(item, basket_item, discounted_price_service: Discounts::DiscountedPriceService.new)
      item.discount.present? ? discounted_price_service.call(item, basket_item) : normal_price(item, basket_item)
    end

    private

    def normal_price(item, basket_item)
      basket_item.final_price + item.price
    end
  end
end
