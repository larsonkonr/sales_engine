# gem 'minitest', '~> 5.2'
# require 'simplecov'; SimpleCov.start
# require 'minitest/autorun'
# require 'minitest/pride'
# require 'stringio'
gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'

require_relative '../../lib/repositories/invoice_repository'

class InvoiceRepositoryTest < Minitest::Test
attr_reader :repository, :sales_engine

  def setup
    @sales_engine = Minitest::Mock.new
    @repository = InvoiceRepository.new(sales_engine, './test/fixtures')
  end

  def test_retrieve_by_id
    results = repository.find_by_id(7)
    assert_equal 44, results.merchant_id
  end

  def test_find_by_customer_id
    results = repository.find_by_customer_id(2)
    assert_equal 9, results.id
  end

  def test_find_by_merchant_id
    results = repository.find_by_merchant_id(75)
    assert_equal 2, results.id
  end

  def test_find_by_status
    results = repository.find_by_status("shipped")
    assert_equal 1, results.id
  end

  def test_find_by_created_at
    results = repository.find_by_created_at("2012-03-06 21:54:10 UTC")
    assert_equal 10, results.id
  end

  def test_find_by_updated_at
    results = repository.find_by_created_at("2012-03-25 09:54:09 UTC")
    assert_equal 1, results.id
  end
end
