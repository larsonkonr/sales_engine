class Merchant
  attr_reader :repository

  ATTRIBUTES = [:id,
                :name,
                :created_at,
                :updated_at,]

  attr_reader *ATTRIBUTES

  def initialize(data, repository)
    @id            = data[:id].to_i
    @name          = data[:name]
    @created_at    = data[:created_at]
    @updated_at    = data[:updated_at]
    @repository    = repository
  end

  def items
    [repository.find_items_from(id)].flatten
  end

  def invoices
    [repository.find_invoices_from(id)].flatten
  end

  def transactions_for_customer(customer_id)
    invoices_for_customer(customer_id)
    .map{|invoice| invoice.transactions}.flatten
  end

  def invoices_for_customer(customer_id)
    repository.find_all_invoices_by_customer_and_merchant_id(customer_id, id)
  end
end
