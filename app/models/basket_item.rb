# frozen_string_literal: true

class BasketItem < ApplicationRecord
  belongs_to :item
  belongs_to :basket

  attribute :price, :float, default: 0.0
  attribute :final_price, :float, default: 0.0
end
