# frozen_string_literal: true

class Basket < ApplicationRecord
  has_many :basket_items, dependent: :delete_all
  has_many :items, through: :basket_items
end
