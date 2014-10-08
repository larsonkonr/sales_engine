require 'simplecov'
SimpleCov.start
require_relative 'test_helper'
require_relative "../lib/merchant"

class MerchantTest < Minitest::Test

  attr_reader :merchant, :repository

  def setup

    @data = {
      id: '15',
      name: 'Cummings-Thiel',
      created_at: '2012-03-27 14:54:11 UTC',
      updated_at: '2012-03-27 14:54:11 UTC'
    }
    @repository = Minitest::Mock.new
    @merchant = Merchant.new(@data)

  end

  def test_it_exists
		assert Merchant
	end

  def test_data
    assert_equal merchant.id, '15'
    assert_equal merchant.name, 'Cummings-Thiel'
    assert_equal merchant.created_at, '2012-03-27 14:54:11 UTC'
    assert_equal merchant.updated_at, '2012-03-27 14:54:11 UTC'
  end

  def test_it_has_a_repository
		assert merchant.repository
	end

	def test_it_delegates_items_to_repository
		repository.expect(:find_items_from, [], ["1"])
		merchant.items
		repository.verify
	end

	def test_it_delegates_invoices_to_repository
		repository.expect(:find_invoices_from, [], ["1"])
		merchant.invoices
		repository.verify
	end
end
