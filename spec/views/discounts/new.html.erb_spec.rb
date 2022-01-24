# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'discounts/new', type: :view do
  before do
    assign(:discount, Discount.new(
                        name: 'MyString',
                        description: 'MyString'
                      ))
  end

  it 'renders new discount form' do
    render

    assert_select 'form[action=?][method=?]', discounts_path, 'post' do
      assert_select 'input[name=?]', 'discount[name]'

      assert_select 'input[name=?]', 'discount[description]'
    end
  end
end
