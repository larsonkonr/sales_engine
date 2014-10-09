class Invoice
  attr_reader :repository

  ATTRIBUTES = [:customer_id,
                :merchant_id,
                :id,
                :status,
                :created_at,
                :updated_at]

  attr_reader *ATTRIBUTES

  def initialize(data, repository)
    @customer_id    = data[:customer_id]
    @merchant_id    = data[:merchant_id]
    @id             = data[:id]
    @status         = data[:status]
    @created_at     = data[:created_at]
    @updated_at     = data[:updated_at]
    @repository     = repository
  end

  def transactions
    repository.find_transactions_from(id)
  end

  def invoice_items
    repository.find_invoice_items_from(id)
  end

  def customers
    repository.find_customers_from(customer_id)
  end

  def merchants
    repository.find_merchants_from(merchant_id)
  end
end
