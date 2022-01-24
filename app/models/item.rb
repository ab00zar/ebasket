class Item < ApplicationRecord
  validates_presence_of :name, :code, :price
end
