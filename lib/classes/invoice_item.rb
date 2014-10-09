class InvoiceItem
  attr_reader :repository

  ATTRIBUTES = [:id,
                :item_id,
                :invoice_id,
                :quantity,
                :unit_price,
                :created_at,
                :updated_at]

  attr_reader *ATTRIBUTES

  def initialize(data)
    @id            = data[:id]
    @item_id       = data[:item_id]
    @invoice_id    = data[:invoice_id]
    @quantity      = data[:quantity]
    @unit_price    = data[:unit_price]
    @created_at    = data[:created_at]
    @updated_at    = data[:updated_at]
  end

  def invoices
    repository.find_invoices_from(id)
  end

  def item_ids
    repository.find_items_from(item_id)
  end
end
