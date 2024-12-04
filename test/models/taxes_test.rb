# frozen_string_literal: true

require 'test_helper'

class TaxesTest < ActiveSupport::TestCase
  def setup
    @taxes = Taxes.new
    @taxes.income = 110_000.99
  end

  test 'taxes should be valid' do
    assert @taxes.valid?
  end

  test 'income should not be blank' do
    @taxes.income = ''
    assert_not @taxes.valid?
  end

  test 'income should not be negative' do
    @taxes.income = -100
    assert_not @taxes.valid?
  end

  test '10,000 income should yield a tax of 1,000' do
    @taxes.income = 10_000
    assert_equal @taxes.calculate, 1000
  end

  test '110,000 income should yield a tax of 11,300' do
    @taxes.income = 110_000
    assert_equal @taxes.calculate, 11_300
  end

  test '160,000 income should yield a tax of 18,200' do
    @taxes.income = 160_000
    assert_equal @taxes.calculate, 18_200
  end

  test 'String input should be converted to 0' do
    @taxes.income = 'Hello World'
    assert_equal @taxes.calculate, 0
  end

  # Test edge cases around the taxbrackets
  test '99,999 income should yield a tax of 9,999.90' do
    @taxes.income = 99_999
    assert_equal @taxes.calculate, 9999.9
  end

  test '100,000 income should yield a tax of 10,000' do
    @taxes.income = 100_000
    assert_equal @taxes.calculate, 10_000
  end

  test '100,001 income should yield a tax of 10,000.13' do
    @taxes.income = 100_001
    assert_equal @taxes.calculate, 10_000.13
  end

  test '149,999 income should yield a tax of 16,499.87' do
    @taxes.income = 149_999
    assert_equal @taxes.calculate, 16_499.87
  end

  test '150,000 income should yield a tax of 16,500' do
    @taxes.income = 150_000
    assert_equal @taxes.calculate, 16_500
  end

  test '150,001 income should yield a tax of 16,500.17' do
    @taxes.income = 150_001
    assert_equal @taxes.calculate, 16_500.17
  end
end
