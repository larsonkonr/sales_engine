gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../../lib/repositories/customer_repository'

# require_relative 'test_helper'
# require 'stringio'

class CustomerRepositoryTest < Minitest::Test
  attr_reader :repository, :sales_engine

  def setup
    @sales_engine = Minitest::Mock.new
    @repository = CustomerRepository.new(sales_engine, './test/fixtures')
  end

  def test_retrieve_by_first_name
    results = repository.find_by_first_name("Heber")
    assert_equal 6, results.id
  end

  def test_find_by_last_name
    results = repository.find_by_last_name("Braun")
    assert_equal "Leanne", results.first_name
  end

  def test_find_by_id
    results = repository.find_by_id("9")
    assert_equal "Dejon", results.first_name
  end

  def test_find_by_created_at
    results = repository.find_by_created_at("2012-03-27 14:54:09 UTC")
    assert_equal "Joey", results.first_name
  end

  def test_find_by_updated_at
    results = repository.find_by_updated_at("2012-03-27 14:54:10 UTC")
    assert_equal "Cecelia", results.first_name
  end
end
