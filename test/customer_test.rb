require 'simplecov'
SimpleCov.start
require_relative 'test_helper'
require_relative "../lib/customer"

class CustomerTest < Minitest::Test

  attr_reader :customer

  def setup

    @data = {
      first_name: 'sam',
      last_name: 'Zephelopagus',
      id: '59',
      created_at: '2012-03-27 14:54:11 UTC',
      updated_at: '2012-03-27 14:54:11 UTC'
    }

    @customer = Customer.new(@data)

  end

  def test_data
    assert_equal customer.first_name, 'sam'
    assert_equal customer.last_name, 'Zephelopagus'
    assert_equal customer.id, '59'
    assert_equal customer.created_at, '2012-03-27 14:54:11 UTC'
    assert_equal customer.updated_at, '2012-03-27 14:54:11 UTC'
  end

end
