# frozen_string_literal: true

class Item < ApplicationRecord
  validates :name, :code, :price, presence: true
end
