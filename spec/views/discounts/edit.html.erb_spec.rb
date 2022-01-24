# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'discounts/edit', type: :view do
  before do
    @discount = assign(:discount, Discount.create!(
                                    name: 'MyString',
                                    description: 'MyString'
                                  ))
  end

  it 'renders the edit discount form' do
    render

    assert_select 'form[action=?][method=?]', discount_path(@discount), 'post' do
      assert_select 'input[name=?]', 'discount[name]'

      assert_select 'input[name=?]', 'discount[description]'
    end
  end
end
