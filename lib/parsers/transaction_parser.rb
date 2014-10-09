require "csv"
require_relative '../classes/transaction'

class TransactionParser
  def create_transactions(repository, filename = "../../data")

    CSV.open("#{filename}/transactions.csv", headers: true, header_converters: :symbol).map do |row|
      Transaction.new(row, repository)
    end
  end
end
