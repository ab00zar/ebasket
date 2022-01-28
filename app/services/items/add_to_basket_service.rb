# frozen_string_literal: true

module Items
  class AddToBasketService
    def initialize(item, basket)
      @item = item
      @basket = basket
    end

    def call(price_service: Items::PriceCalculatorService.new)
      add_item_to_basket unless @basket.items.include?(@item)
      update_item_quantity
      final_price = price_service.call(@item, basket_item)
      price = basket_item.price + @item.price
      basket_item.update(price: price, final_price: final_price)
    end

    private

    def basket_item
      @basket_item ||= BasketItem.where(basket: @basket, item: @item).first
    end

    def update_item_quantity
      basket_item.increment!(:quantity)
    end

    def add_item_to_basket
      @basket.items << @item
    end
  end
end
