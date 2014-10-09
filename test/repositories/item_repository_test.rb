# gem 'minitest', '~> 5.2'
# require 'simplecov'; SimpleCov.start
# require 'minitest/autorun'
# require 'minitest/pride'
# require 'stringio'
gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'

require_relative '../../lib/repositories/item_repository'

class ItemRepositoryTest < Minitest::Test
attr_reader :repository, :sales_engine

  def setup
    @sales_engine = Minitest::Mock.new
    @repository = ItemRepository.new(sales_engine, './test/fixtures')
  end

  def test_find_by_id
    results = repository.find_by_id("9")
    assert_equal 1, results.count
    assert_equal "Item Quo Magnam", results.first.name
  end

  def test_find_by_name
    results = repository.find_by_name("Item Nemo Facere")
    assert_equal 1, results.count
    assert_equal "4", results.first.id
  end

  def test_find_by_description
    results = repository.find_by_description("Fuga assumenda occaecati hic dolorem tenetur dolores nisi. Est tenetur adipisci voluptatem vel. Culpa adipisci consequatur illo. Necessitatibus quis quo velit sed repellendus ut amet.")
    assert_equal 1, results.count
    assert_equal "Item Expedita Fuga", results.first.name
  end

  def test_find_by_unit_price
    results = repository.find_by_unit_price("67076")
    assert_equal 1, results.count
    assert_equal "Item Autem Minima", results.first.name
  end

  def test_find_by_merchant_id
    results = repository.find_by_merchant_id("1")
    assert_equal 10, results.count
    assert_equal "Item Qui Esse", results.first.name
  end

  def test_find_by_created_at
    results = repository.find_by_created_at("2012-03-27 14:53:59 UTC")
    assert_equal 10, results.count
    assert_equal "Item Qui Esse", results.first.name
  end

  def test_find_by_updated_at
    results = repository.find_by_updated_at("2012-03-27 14:53:59 UTC")
    assert_equal 10, results.count
    assert_equal "Item Qui Esse", results.first.name
  end
end
