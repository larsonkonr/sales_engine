# require 'simplecov'
# SimpleCov.start
# require_relative 'test_helper'
gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'

require_relative "../../lib/classes/transaction"

class TransactionTest < Minitest::Test

  attr_reader :transaction

  def setup

    @data = {
      id: '15',
      invoice_id: '12',
      credit_card_number: '4203696133194408',
      credit_card_expiration_date: '',
      result: 'success',
      created_at: '2012-03-27 14:54:11 UTC',
      updated_at: '2012-03-27 14:54:11 UTC'
    }

    @transaction = Transaction.new(@data)

  end

  def test_data
    assert_equal transaction.id, '15'
    assert_equal transaction.invoice_id, '12'
    assert_equal transaction.credit_card_number, '4203696133194408'
    assert_equal transaction.credit_card_expiration_date, ''
    assert_equal transaction.result, 'success'
    assert_equal transaction.created_at, '2012-03-27 14:54:11 UTC'
    assert_equal transaction.updated_at, '2012-03-27 14:54:11 UTC'
  end

end
