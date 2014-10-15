# gem 'minitest', '~> 5.2'
# require 'simplecov'; SimpleCov.start
# require 'minitest/autorun'
# require 'minitest/pride'
# require 'stringio'
gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../../lib/repositories/invoice_item_repository'

class InvoiceItemRepositoryTest < Minitest::Test
  attr_reader :repository, :sales_engine

  def setup
    @sales_engine = Minitest::Mock.new
    @repository = InvoiceItemRepository.new(sales_engine, './test/fixtures')
  end

  def test_find_by_item_id
    results = repository.find_by_item_id(528)
    assert_equal 2, results.id
  end

  def test_find_by_id
    results = repository.find_by_id(6)
    assert_equal 541, results.item_id
  end

  def test_find_by_invoice_id
    results = repository.find_all_by_invoice_id(2)
    assert_equal 9, results.first.id
  end

  def test_find_by_quantity
    results = repository.find_by_quantity(6)
    assert_equal 8, results.id
  end

  def test_find_by_unit_price
    results = repository.find_by_unit_price(BigDecimal.new("1859"))
    assert_equal 10, results.id
  end

  def test_find_by_created_at
    results = repository.find_by_created_at("2012-03-27 14:54:09 UTC")
    assert_equal 1, results.id
  end

  def test_find_by_updated_at
    results = repository.find_by_updated_at("2012-03-27 14:54:09 UTC")
    assert_equal 1, results.id
  end
end
