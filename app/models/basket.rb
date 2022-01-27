# frozen_string_literal: true

class Basket < ApplicationRecord
  has_many :basket_items, dependent: :delete_all
  has_many :items, through: :basket_items
  belongs_to :user

  attribute :price, :float, default: 0.0
  attribute :final_price, :float, default: 0.0
end
