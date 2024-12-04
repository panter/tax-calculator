# frozen_string_literal: true

class Taxes
  include ActiveModel::Attributes
  include ActiveModel::Validations

  attribute :income, :decimal, precision: 9, scale: 2

  validates :income, format: { with: /\A\d+(?:\.\d{0,2})?\z/ },
                     numericality: { greater_than_or_equal_to: 0 },
                     presence: true

  # Define taxbrackets as model constants for easier changes in the future
  LOWER_TAXBRACKET = 100_000
  UPPER_TAXBRACKET = 150_000

  def calculate
    # 10_000 is 10% of 100_000 and 6500 is 13% of 150_000
    if income < LOWER_TAXBRACKET
      income * 0.1
    elsif income <= UPPER_TAXBRACKET
      10_000 + (income - LOWER_TAXBRACKET) * 0.13
    elsif income > UPPER_TAXBRACKET
      10_000 + 6500 + (income - UPPER_TAXBRACKET) * 0.17
    end
  end
end
