class Invoice

  ATTRIBUTES = [:customer_id,
                :merchant_id,
                :id,
                :status,
                :created_at,
                :updated_at]

  attr_reader *ATTRIBUTES

  def initialize(data)
    @customer_id    = data[:customer_id]
    @merchant_id    = data[:merchant_id]
    @id             = data[:id]
    @status         = data[:status]
    @created_at     = data[:created_at]
    @updated_at     = data[:updated_at]
  end
end
