require_relative '../classes/invoice_item'
require_relative '../parsers/invoice_item'


class InvoiceItemRepository

  attr_reader :invoice_items, :sales_engine

  def inspect
    "#<#{self.class} #{@invoice_items.size} rows>"
  end

  def initialize(sales_engine, filepath)
    @invoice_items = InvoiceItemParser.new.create_invoice_items(self, filepath)
    @sales_engine = sales_engine
  end

  def find_by_item_id(item_id)
    invoice_items.find { |invoice_item| invoice_item.item_id == item_id}
  end

  def find_by_invoice_id(invoice_id)
    invoice_items.find { |invoice_item| invoice_item.invoice_id == invoice_id }
  end

  def find_by_id(id)
    invoice_items.find { |invoice_item| invoice_item.id == id }
  end

  def find_by_quantity(quantity)
    invoice_items.find {|invoice_item| invoice_item.quantity == quantity}
  end

  def find_by_unit_price(unit_price)
    invoice_items.find {|invoice_item| invoice_item.unit_price == unit_price}
  end

  def find_by_created_at(created_at)
    invoice_items.find{|invoice_item| invoice_item.created_at == created_at}
  end

  def find_by_updated_at(updated_at)
    invoice_items.find{|invoice_item| invoice_item.updated_at == updated_at}
  end

  def find_all_by_quantity(quantity)
    invoice_items.select{|invoice_item| invoice_item.quantity == quantity}
  end

  def find_all_by_invoice_id(invoice_id)
    invoice_items.select{|invoice_item| invoice_item.invoice_id == invoice_id}
  end

  def random
    invoice_items.sample
  end

end
