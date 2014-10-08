# require 'simplecov'
# SimpleCov.start
# require_relative 'test_helper'
gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'

require_relative "../../lib/classes/invoice"

class InvoiceTest < Minitest::Test

  attr_reader :invoice

  def setup

    @data = {
      id: '15',
      customer_id: '8',
      merchant_id: '53',
      status: 'shipped',
      created_at: '2012-03-27 14:54:11 UTC',
      updated_at: '2012-03-27 14:54:11 UTC'
    }

    @invoice = Invoice.new(@data)

  end

  def test_data
    assert_equal invoice.id, '15'
    assert_equal invoice.customer_id, '8'
    assert_equal invoice.merchant_id, '53'
    assert_equal invoice.status, 'shipped'
    assert_equal invoice.created_at, '2012-03-27 14:54:11 UTC'
    assert_equal invoice.updated_at, '2012-03-27 14:54:11 UTC'
  end

end
