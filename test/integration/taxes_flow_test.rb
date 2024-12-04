# frozen_string_literal: true

require 'test_helper'

class TaxesFlowTest < ActionDispatch::IntegrationTest
  test 'can see the home page' do
    get '/'
    assert_select 'h1', 'Tax Calculator'
  end

  test 'can calculate taxes based on valid income' do
    get '/'
    assert_response :success

    post '', params: {
      income: '110000.99'
    }
    assert_response :success
    assert_select 'p.income', "Your entered income was:\n110,000.99"
  end

  test 'can inform user on invalid entered income' do
    get '/'
    assert_response :success

    post '', params: {
      income: '-110000.99'
    }
    assert_response :success
    assert_select 'p.validation-error', 'You entered: "-110,000.99". Income must be greater than or equal to 0.'
  end
end
