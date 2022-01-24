# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'discounts/index', type: :view do
  before do
    assign(:discounts, [
             Discount.create!(
               name: 'Name',
               description: 'Description'
             ),
             Discount.create!(
               name: 'Name',
               description: 'Description'
             )
           ])
  end

  it 'renders a list of discounts' do
    render
    assert_select 'tr>td', text: 'Name'.to_s, count: 2
    assert_select 'tr>td', text: 'Description'.to_s, count: 2
  end
end
