# frozen_string_literal: true

module BasketItems
  class UpdateService
    BASKET_ITEM_PARAMS = %i[price final_price].freeze

    def call(basket_item, **params)
      basket_item.update(verify(params))
    end

    private

    def verify(params)
      params.slice(*BASKET_ITEM_PARAMS)
    end
  end
end
