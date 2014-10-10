# require 'simplecov'
# SimpleCov.start
# require_relative 'test_helper'
gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'


require_relative "../../lib/classes/invoice_item"

class InvoiceItemTest < Minitest::Test

  attr_reader :invoice_item, :repository

  def setup
    data = {
      item_id: 1920,
      invoice_id: 1,
      quantity: 9,
      unit_price: BigDecimal.new("13635"),
      id: 15,
      created_at: '2012-03-27 14:54:11 UTC',
      updated_at: '2012-03-27 14:54:11 UTC'
    }

    @repository = Minitest::Mock.new
    @invoice_item = InvoiceItem.new(data, repository)

  end

  def test_data
    assert_equal invoice_item.item_id, 1920
    assert_equal invoice_item.invoice_id, 1
    assert_equal invoice_item.id, 15
    assert_equal invoice_item.quantity, 9
    assert_equal invoice_item.unit_price, BigDecimal.new('13635')
    assert_equal invoice_item.created_at, '2012-03-27 14:54:11 UTC'
    assert_equal invoice_item.updated_at, '2012-03-27 14:54:11 UTC'
  end

  def test_it_exists
    assert InvoiceItem
  end

  def test_it_has_a_repository
    assert invoice_item.repository
  end

  def test_it_delegates_items_to_repository
    repository.expect(:find_items_from, [], [1920])
    invoice_item.items
    repository.verify
  end

  def test_it_delegates_invoices_to_repository
    repository.expect(:find_invoices_from, [], [15])
    invoice_item.invoices
    repository.verify
  end
end
