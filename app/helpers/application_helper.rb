# frozen_string_literal: true

module ApplicationHelper
  def human_readable_number(number)
    return unless number?(number)

    # Edgecase in which -0 or -0.0 or -0.00 is entered
    if number.to_s == '-0.0'
      '-0'
    elsif (number % 1).zero?
      number_with_delimiter(number.to_i)
    else
      number_with_delimiter(number_with_precision(number, precision: 2))
    end
  end

  def number?(string)
    true if Float(string)
  rescue StandardError
    false
  end
end
