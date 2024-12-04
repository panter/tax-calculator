# frozen_string_literal: true

class TaxesController < ApplicationController
  def calculator
    # render the calculator form
  end

  def calculate
    # calculate taxes and render result
    @taxes = Taxes.new
    @taxes.income = params[:income].to_d unless params[:income].empty?
    render :calculator
  end
end
