# require 'simplecov'
# SimpleCov.start
# require_relative 'test_helper'
gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'

require_relative "../../lib/classes/invoice"

class InvoiceTest < Minitest::Test

  attr_reader :invoice, :repository

  def setup

    data = {
      id: '15',
      customer_id: '8',
      merchant_id: '53',
      status: 'shipped',
      created_at: '2012-03-27 14:54:11 UTC',
      updated_at: '2012-03-27 14:54:11 UTC'
    }

    @repository = Minitest::Mock.new
    @invoice = Invoice.new(data, repository)

  end

  def test_data
    assert_equal invoice.id, '15'
    assert_equal invoice.customer_id, '8'
    assert_equal invoice.merchant_id, '53'
    assert_equal invoice.status, 'shipped'
    assert_equal invoice.created_at, '2012-03-27 14:54:11 UTC'
    assert_equal invoice.updated_at, '2012-03-27 14:54:11 UTC'
  end

  def test_it_exists
    assert Invoice
  end

  def test_it_has_a_repository
    assert invoice.repository
  end

  def test_it_delegates_transactions_to_repository
    repository.expect(:find_transactions_from, [], ["15"])
    invoice.transactions
    repository.verify
  end

  def test_it_delegates_invoice_items_to_repository
    repository.expect(:find_invoice_items_from, [], ["15"])
    invoice.invoice_items
    repository.verify
  end

  def test_it_delegates_customers_to_repository
    repository.expect(:find_customers_from, [], ["8"])
    invoice.customers
    repository.verify
  end

  def test_it_delegates_merchants_to_repository
    repository.expect(:find_merchants_from, [], ["53"])
    invoice.merchants
    repository.verify
  end
end
