gem 'minitest', '~> 5.2'
require 'simplecov'; SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'

# require_relative 'test_helper'
# require 'stringio'
require_relative '../lib/repositories/customer_repository'

class CustomerRepositoryTest < Minitest::Test

  def test_retrieve_by_first_name
    customers = [
    { first_name: 'Connor', },
    { first_name: 'Kalah', },
    { first_name: 'Meredith', },
    ].map {|row| Customer.new(row)}
    assert_equal ["Kalah"],
    CustomerRepository.new(customers).find_by_first_name("Kalah")
    .map {|customer| customer.first_name}
  end

  def test_retrieve_by_last_name
    customers = [
    { last_name: 'Slevetson', },
    { last_name: 'Cheek', },
    { last_name: 'Merryweather', },
    ].map {|row| Customer.new(row)}
    assert_equal ["Slevetson"],
    CustomerRepository.new(customers).find_by_last_name("Slevetson")
    .map {|customer| customer.last_name}
  end

  def test_find_by_id
    customers = [
    { id: '8', },
    { id: '900', },
    { id: '127', },
    ].map {|row| Customer.new(row)}
    assert_equal ["127"],
    CustomerRepository.new(customers).find_by_id("127")
    .map {|customer| customer.id}
  end

  def test_find_by_created_at
    customers = [
    { created_at: '2012-03-27 14:54:09 UTC', },
    { created_at: '2012-03-27 14:54:11 UTC', },
    { created_at: '2012-03-27 14:54:10 UTC', },
    ].map {|row| Customer.new(row)}
    assert_equal ["2012-03-27 14:54:10 UTC"],
    CustomerRepository.new(customers).find_by_created_at("2012-03-27 14:54:10 UTC")
    .map {|customer| customer.created_at}
  end

  def test_find_by_updated_at
    customers = [
    { updated_at: '2012-03-27 14:54:10 UTC', },
    { updated_at: '2012-03-27 14:54:11 UTC', },
    { updated_at: '2012-03-27 14:54:09 UTC', },
    ].map {|row| Customer.new(row)}
    assert_equal ["2012-03-27 14:54:09 UTC"],
    CustomerRepository.new(customers).find_by_updated_at("2012-03-27 14:54:09 UTC")
    .map {|customer| customer.updated_at}
  end
end
