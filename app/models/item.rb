# frozen_string_literal: true

class Item < ApplicationRecord
  validates :name, :code, :price, presence: true

  has_many :basket_items, dependent: :delete_all
  has_many :baskets, through: :basket_items
  has_one :discount, dependent: :nullify
end
