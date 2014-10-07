require_relative 'test_helper'
require_relative '../lib/parser'

class ParserTest < Minitest::Test

  def test_it_loads_customers_file
    rows = Parser.load_file("test/fixtures/customers.csv")
    assert rows.count >= 10
  end

  def test_it_parses_customers
    customers = Parser.load_customers("test/fixtures/customers.csv")
    assert customers.first.kind_of?(Customer)
  end

  def test_it_parses_customers_with_data
    customers = Parser.load_customers("test/fixtures/customers.csv")
    assert_equal 'Joey', customers.first.first_name
  end

  # def test_it_loads_invoice_items_file
  #   file = Parser.load_file("../data/invoice_items.csv")
  #   assert_equal 'data/invoice_items.csv', file.path
  # end
  #
  #
  # def test_it_loads_invoices_file
  #   file = Parser.load_file("../data/invoices.csv")
  #   assert_equal 'data/invoices.csv', file.path
  # end
  #
  #
  # def test_it_loads_items_file
  #   file = Parser.load_file("../data/items.csv")
  #   assert_equal 'data/items.csv', file.path
  # end
  #
  #
  # def test_it_loads_merchants_file
  #   file = Parser.load_file("../data/merchants.csv")
  #   assert_equal 'data/merchants.csv', file.path
  # end
  #
  #
  # def test_it_loads_transactions_file
  #   file = Parser.load_file("../data/transactions.csv")
  #   assert_equal 'data/transactions.csv', file.path
  # end
end
