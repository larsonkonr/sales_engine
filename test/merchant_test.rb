require 'simplecov'
SimpleCov.start
require_relative 'test_helper'
require_relative "../lib/merchant"

class MerchantTest < Minitest::Test

  attr_reader :merchant

  def setup

    @data = {
      id: '15',
      name: 'Cummings-Thiel',
      created_at: '2012-03-27 14:54:11 UTC',
      updated_at: '2012-03-27 14:54:11 UTC'
    }

    @merchant = Merchant.new(@data)

  end

  def test_data
    assert_equal merchant.id, '15'
    assert_equal merchant.name, 'Cummings-Thiel'
    assert_equal merchant.created_at, '2012-03-27 14:54:11 UTC'
    assert_equal merchant.updated_at, '2012-03-27 14:54:11 UTC'
  end

end
