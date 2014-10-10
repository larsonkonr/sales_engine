require "bigdecimal"

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

  def initialize(data, repository)
    @id            = data[:id].to_i
    @item_id       = data[:item_id].to_i
    @invoice_id    = data[:invoice_id].to_i
    @quantity      = data[:quantity].to_i
    @unit_price    = BigDecimal.new(data[:unit_price])
    @created_at    = data[:created_at]
    @updated_at    = data[:updated_at]
    @repository    = repository
  end

  def invoices
    repository.find_invoices_from(id)
  end

  def items
    repository.find_items_from(item_id)
  end

  def item
    item_repository.find_by_id(item_id)
  end

  def invoice
    invoice_repository.find_by_id(invoice_id)
  end

private

  def item_repository
    repository.sales_engine.item_repository
  end

  def invoice_repository
    repository.sales_engine.invoice_repository
  end
end
