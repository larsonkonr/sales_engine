# require_relative '../test_helper'
# require 'stringio'
gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../../lib/repositories/merchant_repository'

class MerchantRepositoryTest < Minitest::Test
  attr_reader :repository, :sales_engine

  def setup
    @sales_engine = Minitest::Mock.new
    @repository = MerchantRepository.new(sales_engine, './test/fixtures')
  end


  def test_retrieve_by_name
    results = repository.find_by_name("Williamson Group")
    assert_equal 5, results.id
  end

  def test_find_by_id
    results = repository.find_by_id(5)
    assert_equal "Williamson Group", results.name
  end

  def test_find_by_created_at
    merchant = repository.find_by_created_at("2012-03-27 14:53:59 UTC")
    assert_equal "Schroeder-Jerde", merchant.name
  end

  def test_find_by_updated_at
    results = repository.find_by_created_at("2012-03-27 14:54:00 UTC")
    assert_equal "Bechtelar, Jones and Stokes", results.name
  end
end
