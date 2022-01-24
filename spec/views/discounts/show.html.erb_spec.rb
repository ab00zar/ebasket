# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'discounts/show', type: :view do
  before do
    @discount = assign(:discount, Discount.create!(
                                    name: 'Name',
                                    description: 'Description'
                                  ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Description/)
  end
end
