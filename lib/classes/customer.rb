class Customer
  attr_reader :repository

  ATTRIBUTES = [:first_name,
                :last_name,
                :id,
                :created_at,
                :updated_at]

  attr_reader *ATTRIBUTES

  def initialize(data)
    @first_name    = data[:first_name]
    @last_name     = data[:last_name]
    @id            = data[:id]
    @created_at    = data[:created_at]
    @updated_at    = data[:updated_at]
  end

  def invoices
    repository.find_invoices_from(id)
  end
end
