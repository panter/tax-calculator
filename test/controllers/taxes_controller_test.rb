# frozen_string_literal: true

require 'test_helper'

class TaxesControllerTest < ActionDispatch::IntegrationTest
  test 'should get calculator' do
    get '/'
    assert_response :success
  end
end
