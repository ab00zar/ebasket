# frozen_string_literal: true

module Items
  class AddToBasketService
    def initialize(item, basket)
      @item = item
      @basket = basket
    end

    def call(update_service: BasketItems::UpdateService.new)
      add_item_to_basket unless @basket.items.include?(@item)
      update_item_quantity
      update_service.call(basket_item, result)
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

    def result(price_service: Items::PriceCalculatorService)
      price_service.new(@item, basket_item).call
    end
  end
end
