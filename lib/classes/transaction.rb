class Transaction
  attr_reader :repository

  ATTRIBUTES = [:id,
                :invoice_id,
                :credit_card_number,
                :result,
                :credit_card_expiration_date,
                :created_at,
                :updated_at]

  attr_reader *ATTRIBUTES

  def initialize(data, repository)
    @id                             = data[:id].to_i
    @invoice_id                     = data[:invoice_id].to_i
    @credit_card_number             = data[:credit_card_number]
    @credit_card_expiration_date    = data[:credit_card_expiration_date]
    @result                         = data[:result]
    @created_at                     = data[:created_at]
    @updated_at                     = data[:updated_at]
    @repository                     = repository
  end

  def invoices
    repository.find_invoices_from(id)
  end

  def invoice
    repository.find_invoice_from(invoice_id)
  end


end
