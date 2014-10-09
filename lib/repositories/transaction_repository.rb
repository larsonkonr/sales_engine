require_relative '../classes/transaction'
require_relative '../parsers/transaction_parser'


class TransactionRepository

  attr_reader :transactions, :sales_engine

  def initialize(sales_engine, filepath)
    @transactions = TransactionParser.new.create_transactions(self, filepath)
    @sales_engine = sales_engine
  end

  def find_by_id(id)
    transactions.select { |transaction| transaction.id == id}
  end

  def find_by_invoice_id(invoice_id)
    transactions.select { |transaction| transaction.invoice_id == invoice_id}
  end

  def find_by_credit_card_number(credit_card_number)
    transactions.select { |transaction| transaction.credit_card_number == credit_card_number}
  end

  def find_by_credit_card_expiration_date(credit_card_expiration_date)
    transactions.select { |transaction| transaction.credit_card_expiration_date == credit_card_expiration_date}
  end

  def find_by_result(result)
    transactions.select { |transaction| transaction.result == result}
  end

  def find_by_created_at(created_at)
    transactions.select {|transaction| transaction.created_at == created_at}
  end

  def find_by_updated_at(updated_at)
    transactions.select {|transaction| transaction.updated_at == updated_at}
  end

end
