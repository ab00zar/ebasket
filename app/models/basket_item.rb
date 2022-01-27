# frozen_string_literal: true

class BasketItem < ApplicationRecord
  belongs_to :item
  belongs_to :basket

  attribute :price, :integer, default: 0
  attribute :final_price, :integer, default: 0
end
