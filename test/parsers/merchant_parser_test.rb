# require_relative 'test_helper'
gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../../lib/parsers/merchant_parser'

class MerchantParserTest < Minitest::Test

  # def test_it_loads_customers_file
  #   skip
  #   rows = MerchantParser.load_file("test/fixtures/customers.csv")
  #   assert rows.count >= 10
  # end

  def test_it_parses_merchants
    merchants = MerchantParser.create_merchants("test/fixtures/customers.csv")
    assert merchants.first.kind_of?(MerchantParser)
  end

  # def test_it_parses_customers_with_data
  #   skip
  #   customers =MerchantParser.load_customers("test/fixtures/customers.csv")
  #   assert_equal 'Joey', customers.first.first_name
  # end
end
