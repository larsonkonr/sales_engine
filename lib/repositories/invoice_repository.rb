require_relative '../classes/invoice'
require_relative '../parsers/invoice_parser'


class InvoiceRepository

  attr_reader :invoices, :sales_engine, :customer

  def inspect
    "#<#{self.class} #{@merchants.size} rows>"
  end

  def initialize(sales_engine, filepath)
    @invoices = InvoiceParser.new.create_invoices(self, filepath)
    @sales_engine = sales_engine
  end

  def find_by_id(id)
    invoices.find { |invoice| invoice.id == id }
  end

  def find_by_customer_id(customer_id)
    invoices.find { |invoice| invoice.customer_id == customer_id }
  end

  def find_by_merchant_id(merchant_id)
    invoices.find { |invoice| invoice.merchant_id == merchant_id}
  end

  def find_all_by_merchant_id(merchant_id)
    invoices.select { |invoice| invoice.merchant_id == merchant_id}
  end

  def find_by_status(status)
    invoices.find { |invoice| invoice.status == status }
  end

  def find_by_created_at(created_at)
    invoices.find { |invoice| invoice.created_at == created_at }
  end

  def find_by_updated_at(updated_at)
    invoices.find { |invoice| invoice.updated_at == updated_at }
  end

  def find_transactions_from(id)
    sales_engine.transaction_repository.find_by_invoice_id(id)
  end

  def find_all_by_customer_id(customer_id)
    invoices.select { |invoice| invoice.customer_id == customer_id }
  end

  def find_all_by_status(status)
    invoices.select { |invoice| invoice.status == status }
  end

  def find_by_invoice_id(invoice_id)
    invoices.find { |invoice| invoice.invoice_id == invoice_id}
  end

  def find_items_from(invoice_id)
    find_invoice_items_from(invoice_id).map(&:item)
  end

  def find_invoice_items_from(invoice_id)
    sales_engine.invoice_item_repository.find_all_by_invoice_id(invoice_id)
  end

  def find_customer_from(customer_id)
    sales_engine.customer_repository.find_by_id(customer_id)
  end

  def has_the_correct_number_of_them(invoice_id)
    sales_engine.transaction_repository.find_by_invoice_id(invoice_id)
  end

  def random
    invoices.sample
  end
end
