# require 'simplecov'
# SimpleCov.start
# require_relative 'test_helper'
gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative "../../lib/classes/customer"

class CustomerTest < Minitest::Test

  attr_reader :customer, :repository

  def setup

    @data = {
      first_name: 'sam',
      last_name: 'Zephelopagus',
      id: 59,
      created_at: '2012-03-27 14:54:11 UTC',
      updated_at: '2012-03-27 14:54:11 UTC'
    }

    @repository = Minitest::Mock.new
    @customer = Customer.new(@data, repository)

  end

  def test_it_exists
    assert Customer
  end

  def test_data
    assert_equal customer.first_name, 'sam'
    assert_equal customer.last_name, 'Zephelopagus'
    assert_equal customer.id, 59
    assert_equal customer.created_at, '2012-03-27 14:54:11 UTC'
    assert_equal customer.updated_at, '2012-03-27 14:54:11 UTC'
  end

  def test_it_has_a_repository
    assert customer.repository
  end

  def test_it_delegates_invoices_to_repository
    repository.expect(:find_invoices_from, [], [59])
    customer.invoices
    repository.verify
  end
end
