# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Items
Item.find_or_create_by(name:'Green Tea', code: 'GR1', price: 3.11, discount_id: 1, photo: 'https://www.lipton.com/content/dam/unilever/lipton_international/united_states_of_america/pack_shot/041000671517.01-39537116-png.png')
Item.find_or_create_by(name:'Strawberries', code: 'SR1', price: 5.00, discount_id: 2, photo: 'https://www.gardeningknowhow.com/wp-content/uploads/2021/07/ripe-red-strawberries.jpg')
Item.find_or_create_by(name:'Coffee', code: 'CF1', price: 11.23, discount_id: 3, photo: 'https://www.tastingtable.com/img/gallery/coffee-brands-ranked-from-worst-to-best/intro-1640648130.jpg')

# Discounts
Discount.find_or_create_by(id: 1, name: 'buy1get1', description: 'buy-one-get-one-free')
Discount.find_or_create_by(id: 2, name: 'buy3get0.5', description: 'buy 3 or more, 0.5 will be reduced from the original price')
Discount.find_or_create_by(id: 3, name: 'buy3pay2/3', description: 'buy 3 or more, price drops to 2/3 of the original price')

Basket.find_or_create_by(id: 1, price: 0.0, final_price: 0.0)
