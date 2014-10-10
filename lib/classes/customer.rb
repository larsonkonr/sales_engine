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
    repository.sales_engine.invoice_repository
    .find_all_by_customer_id(id)
  end
end
