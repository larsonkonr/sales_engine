gem 'minitest', '~> 5.2'
require 'simplecov'; SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require 'stringio'
require_relative '../lib/repositories/transaction_repository'

class TransactionRepositoryTest < Minitest::Test

  def test_find_by_id
    transactions = [
    { id: '8', },
    { id: '900', },
    { id: '127', },
    ].map {|row| Transaction.new(row)}
    assert_equal ["127"],
    TransactionRepository.new(transactions).find_by_id("127")
    .map {|transaction| transaction.id}
  end

  def test_find_by_invoice_id
    transactions = [
    { invoice_id: '1', },
    { invoice_id: '2', },
    { invoice_id: '3', },
    ].map {|row| Transaction.new(row)}
    assert_equal ["2"],
    TransactionRepository.new(transactions).find_by_invoice_id("2")
    .map {|transaction| transaction.invoice_id}
  end

  def test_find_by_credit_card_number
    transactions = [
    { credit_card_number: '4654405418249632', },
    { credit_card_number: '4515551623735607', },
    { credit_card_number: '4801647818676136', },
    ].map {|row| Transaction.new(row)}
    assert_equal ["4654405418249632"],
    TransactionRepository.new(transactions).find_by_credit_card_number("4654405418249632")
    .map {|transaction| transaction.credit_card_number}
  end

  def test_find_by_credit_card_expiration_date
    transactions = [
    { credit_card_expiration_date: '2012-03-27', },
    { credit_card_expiration_date: '2012-03-25', },
    { credit_card_expiration_date: '2012-03-22', },
    ].map {|row| Transaction.new(row)}
    assert_equal ["2012-03-22"],
    TransactionRepository.new(transactions).find_by_credit_card_expiration_date("2012-03-22")
    .map {|transaction| transaction.credit_card_expiration_date}
  end

  def test_find_by_result
    transactions = [
    { result: 'success', },
    { result: 'failed', },
    { result: 'failed', },
    ].map {|row| Transaction.new(row)}
    assert_equal ["success"],
    TransactionRepository.new(transactions).find_by_result("success")
    .map {|transaction| transaction.result}
  end

  def test_find_by_created_at
    transactions = [
    { created_at: '2012-03-27 14:54:09 UTC', },
    { created_at: '2012-03-27 14:54:11 UTC', },
    { created_at: '2012-03-27 14:54:10 UTC', },
    ].map {|row| Transaction.new(row)}
    assert_equal ["2012-03-27 14:54:10 UTC"],
    TransactionRepository.new(transactions).find_by_created_at("2012-03-27 14:54:10 UTC")
    .map {|transaction| transaction.created_at}
  end

  def test_find_by_updated_at
    transactions = [
    { updated_at: '2012-03-27 14:54:10 UTC', },
    { updated_at: '2012-03-27 14:54:11 UTC', },
    { updated_at: '2012-03-27 14:54:09 UTC', },
    ].map {|row| Transaction.new(row)}
    assert_equal ["2012-03-27 14:54:09 UTC"],
    TransactionRepository.new(transactions).find_by_updated_at("2012-03-27 14:54:09 UTC")
    .map {|transaction| transaction.updated_at}
  end
end
