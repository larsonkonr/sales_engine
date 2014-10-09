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
    @repository = CustomerRepository.new(sales_engine, './test/fixtures/customers.csv')
  end

  def test_retrieve_by_first_name
    results = repository.find_by_first_name("Heber")
    assert_equal 1, results.count
    assert_equal "6", results.first.id
  end

  def test_find_by_last_name
    results = repository.find_by_last_name("Braun")
    assert_equal 1, results.count
    assert_equal "Leanne", results.first.first_name
  end

  def test_find_by_id
    results = repository.find_by_id("9")
    assert_equal 1, results.count
    assert_equal "Dejon", results.first.first_name
  end

  def test_find_by_created_at
    results = repository.find_by_created_at("2012-03-27 14:54:09 UTC")
    assert_equal 1, results.count
    assert_equal "Joey", results.first.first_name
  end

  def test_find_by_updated_at
    results = repository.find_by_updated_at("2012-03-27 14:54:10 UTC")
    assert_equal 6, results.count
    assert_equal "Cecelia", results.first.first_name
  end
  # def test_retrieve_by_first_name
  #   customers = [
  #   { first_name: 'Connor', },
  #   { first_name: 'Kalah', },
  #   { first_name: 'Meredith', },
  #   ].map {|row| Customer.new(row)}
  #   assert_equal ["Kalah"],
  #   CustomerRepository.new(customers).find_by_first_name("Kalah")
  #   .map {|customer| customer.first_name}
  # end
  #
  # def test_retrieve_by_last_name
  #   customers = [
  #   { last_name: 'Slevetson', },
  #   { last_name: 'Cheek', },
  #   { last_name: 'Merryweather', },
  #   ].map {|row| Customer.new(row)}
  #   assert_equal ["Slevetson"],
  #   CustomerRepository.new(customers).find_by_last_name("Slevetson")
  #   .map {|customer| customer.last_name}
  # end
  #
  # def test_find_by_id
  #   customers = [
  #   { id: '8', },
  #   { id: '900', },
  #   { id: '127', },
  #   ].map {|row| Customer.new(row)}
  #   assert_equal ["127"],
  #   CustomerRepository.new(customers).find_by_id("127")
  #   .map {|customer| customer.id}
  # end
  #
  # def test_find_by_created_at
  #   customers = [
  #   { created_at: '2012-03-27 14:54:09 UTC', },
  #   { created_at: '2012-03-27 14:54:11 UTC', },
  #   { created_at: '2012-03-27 14:54:10 UTC', },
  #   ].map {|row| Customer.new(row)}
  #   assert_equal ["2012-03-27 14:54:10 UTC"],
  #   CustomerRepository.new(customers).find_by_created_at("2012-03-27 14:54:10 UTC")
  #   .map {|customer| customer.created_at}
  # end
  #
  # def test_find_by_updated_at
  #   customers = [
  #   { updated_at: '2012-03-27 14:54:10 UTC', },
  #   { updated_at: '2012-03-27 14:54:11 UTC', },
  #   { updated_at: '2012-03-27 14:54:09 UTC', },
  #   ].map {|row| Customer.new(row)}
  #   assert_equal ["2012-03-27 14:54:09 UTC"],
  #   CustomerRepository.new(customers).find_by_updated_at("2012-03-27 14:54:09 UTC")
  #   .map {|customer| customer.updated_at}
  # end
end
