# gem 'minitest', '~> 5.2'
# require 'simplecov'; SimpleCov.start
# require 'minitest/autorun'
# require 'minitest/pride'
# require 'stringio'
gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'

require_relative '../../lib/repositories/transaction_repository'

class TransactionRepositoryTest < Minitest::Test
attr_reader :repository, :sales_engine

  def setup
    @sales_engine = Minitest::Mock.new
    @repository = TransactionRepository.new(sales_engine, './test/fixtures')
  end

  def test_retrieve_by_id
    results = repository.find_by_id("6")
    assert_equal 1, results.count
    assert_equal "4203696133194408", results.first.credit_card_number
  end

  def test_find_by_invoice_id
    results = repository.find_by_invoice_id("5")
    assert_equal 1, results.count
    assert_equal "4", results.first.id
  end

  def test_find_by_credit_card_number
    results = repository.find_by_credit_card_number("4140149827486249")
    assert_equal 1, results.count
    assert_equal "9", results.first.id
  end

  def test_find_by_credit_card_expiration_date
    results = repository.find_by_credit_card_expiration_date(nil)
    assert_equal 10, results.count
    assert_equal "1", results.first.id
  end

  def test_find_by_result
    results = repository.find_by_result("success")
    assert_equal 10, results.count
    assert_equal "1", results.first.id
  end

  def test_find_by_created_at
    results = repository.find_by_created_at("2012-03-27 14:54:09 UTC")
    assert_equal 2, results.count
    assert_equal "1", results.first.id
  end

  def test_find_by_updated_at
    results = repository.find_by_updated_at("2012-03-27 14:54:10 UTC")
    assert_equal 8, results.count
    assert_equal "3", results.first.id
  end
end
