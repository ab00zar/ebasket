# frozen_string_literal: true

json.extract! discount, :id, :name, :description, :created_at, :updated_at
json.url discount_url(discount, format: :json)
