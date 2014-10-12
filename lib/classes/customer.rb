class Customer
  attr_reader :repository

  ATTRIBUTES = [:first_name,
                :last_name,
                :id,
                :created_at,
                :updated_at]

  attr_reader *ATTRIBUTES

  def initialize(data, repository)
    @first_name    = data[:first_name]
    @last_name     = data[:last_name]
    @id            = data[:id].to_i
    @created_at    = data[:created_at]
    @updated_at    = data[:updated_at]
    @repository    = repository
  end

  def invoices
    repository.find_invoices_from(id)
  end

  def transactions
    invoices.map{|invoice| invoice.transactions}.flatten
  end

  def merchants
    invoices.map{|invoice| invoice.merchant}
  end

  def favorite_merchant
    merchants.max_by{|merchant| merchant.transactions_for_customer(id).size}
  end

end
