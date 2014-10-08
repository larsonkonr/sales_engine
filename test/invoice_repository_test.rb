gem 'minitest', '~> 5.2'
require 'simplecov'; SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require 'stringio'
require_relative '../lib/repositories/invoice_repository'

class InvoiceRepositoryTest < Minitest::Test

  def test_find_by_id
    invoices = [
    { id: '8', },
    { id: '900', },
    { id: '127', },
    ].map {|row| Invoice.new(row)}
    assert_equal ["127"],
    InvoiceRepository.new(invoices).find_by_id("127")
    .map {|invoice| invoice.id}
  end

  def test_find_by_customer_id
    invoices = [
    { customer_id: '1', },
    { customer_id: '2', },
    { customer_id: '3', },
    ].map {|row| Invoice.new(row)}
    assert_equal ["2"],
    InvoiceRepository.new(invoices).find_by_customer_id("2")
    .map {|invoice| invoice.customer_id}
  end

  def test_find_by_merchant_id
    invoices = [
    { merchant_id: '26', },
    { merchant_id: '75', },
    { merchant_id: '33', },
    ].map {|row| Invoice.new(row)}
    assert_equal ["33"],
    InvoiceRepository.new(invoices).find_by_merchant_id("33")
    .map {|invoice| invoice.merchant_id}
  end

  def test_find_by_status
    invoices = [
    { status: 'shipped', },
    { status: 'failed', },
    { status: 'failed', },
    ].map {|row| Invoice.new(row)}
    assert_equal ["shipped"],
    InvoiceRepository.new(invoices).find_by_status("shipped")
    .map {|invoice| invoice.status}
  end

  def test_find_by_created_at
    invoices = [
    { created_at: '2012-03-27 14:54:09 UTC', },
    { created_at: '2012-03-27 14:54:11 UTC', },
    { created_at: '2012-03-27 14:54:10 UTC', },
    ].map {|row| Invoice.new(row)}
    assert_equal ["2012-03-27 14:54:10 UTC"],
    InvoiceRepository.new(invoices).find_by_created_at("2012-03-27 14:54:10 UTC")
    .map {|invoice| invoice.created_at}
  end

  def test_find_by_updated_at
    invoices = [
    { updated_at: '2012-03-27 14:54:10 UTC', },
    { updated_at: '2012-03-27 14:54:11 UTC', },
    { updated_at: '2012-03-27 14:54:09 UTC', },
    ].map {|row| Invoice.new(row)}
    assert_equal ["2012-03-27 14:54:09 UTC"],
    InvoiceRepository.new(invoices).find_by_updated_at("2012-03-27 14:54:09 UTC")
    .map {|invoice| invoice.updated_at}
  end
end
