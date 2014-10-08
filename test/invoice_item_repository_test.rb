gem 'minitest', '~> 5.2'
require 'simplecov'; SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require 'stringio'
require_relative '../lib/repositories/invoice_item_repository'

class InvoiceItemRepositoryTest < Minitest::Test

  def test_find_by_item_id
    invoice_items = [
    { item_id: '539', },
    { item_id: '529', },
    { item_id: '1832', },
    ].map {|row| InvoiceItem.new(row)}
    assert_equal ["539"],
    InvoiceItemRepository.new(invoice_items).find_by_item_id("539")
    .map {|invoice_item| invoice_item.item_id}
  end

  def test_find_by_invoice_id
    invoice_items = [
    { invoice_id: '1', },
    { invoice_id: '2', },
    { invoice_id: '3', },
    ].map {|row| InvoiceItem.new(row)}
    assert_equal ["2"],
    InvoiceItemRepository.new(invoice_items).find_by_invoice_id("2")
    .map {|invoice_item| invoice_item.invoice_id}
  end

  def test_find_by_id
    invoice_items = [
    { id: '8', },
    { id: '900', },
    { id: '127', },
    ].map {|row| InvoiceItem.new(row)}
    assert_equal ["127"],
    InvoiceItemRepository.new(invoice_items).find_by_id("127")
    .map {|invoice_item| invoice_item.id}
  end

  def test_find_by_quantity
    invoice_items = [
    { quantity: '8', },
    { quantity: '9', },
    { quantity: '5', },
    ].map {|row| InvoiceItem.new(row)}
    assert_equal ["8"],
    InvoiceItemRepository.new(invoice_items).find_by_quantity("8")
    .map {|invoice_item| invoice_item.quantity}
  end

  def test_find_by_unit_price
    invoice_items = [
    { unit_price: '13635', },
    { unit_price: '79140', },
    { unit_price: '29973', },
    ].map {|row| InvoiceItem.new(row)}
    assert_equal ["29973"],
    InvoiceItemRepository.new(invoice_items).find_by_unit_price("29973")
    .map {|invoice_item| invoice_item.unit_price}
  end

  def test_find_by_created_at
    invoice_items = [
    { created_at: '2012-03-27 14:54:09 UTC', },
    { created_at: '2012-03-27 14:54:11 UTC', },
    { created_at: '2012-03-27 14:54:10 UTC', },
    ].map {|row| InvoiceItem.new(row)}
    assert_equal ["2012-03-27 14:54:10 UTC"],
    InvoiceItemRepository.new(invoice_items).find_by_created_at("2012-03-27 14:54:10 UTC")
    .map {|invoice_item| invoice_item.created_at}
  end

  def test_find_by_updated_at
    invoice_items = [
    { updated_at: '2012-03-27 14:54:10 UTC', },
    { updated_at: '2012-03-27 14:54:11 UTC', },
    { updated_at: '2012-03-27 14:54:09 UTC', },
    ].map {|row| InvoiceItem.new(row)}
    assert_equal ["2012-03-27 14:54:09 UTC"],
    InvoiceItemRepository.new(invoice_items).find_by_updated_at("2012-03-27 14:54:09 UTC")
    .map {|invoice_item| invoice_item.updated_at}
  end
end
