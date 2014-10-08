# require_relative '../test_helper'
# require 'stringio'
gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../../lib/repositories/merchant_repository'

class MerchantRepositoryTest < Minitest::Test
  attr_reader :repo, :sales_engine

  def setup
    @sales_engine = Minitest::Mock.new
    # require "pry";binding.pry
    @repo = MerchantRepository.new(sales_engine, './test/fixtures/merchants.csv')
  end


  def test_retrieve_by_name
    results = repo.find_by_name("Williamson Group")
    assert_equal 2, results.count
    assert_equal "5", results.first.id
  end

  def test_find_by_id
    results = repo.find_by_id("5")
    assert_equal 1, results.count
    assert_equal "Williamson Group", results.first.name
  end

  def test_find_by_created_at
    results = repo.find_by_created_at("2012-03-27 14:53:59 UTC")
    assert_equal 9, results.count
    assert_equal "Schroeder-Jerde", results.first.name
  end

  def test_find_by_updated_at
    results = repo.find_by_created_at("2012-03-27 14:54:00 UTC")
    assert_equal 1, results.count
    assert_equal "Bechtelar, Jones and Stokes", results.first.name
  end
end
