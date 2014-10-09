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
    invoices.select { |invoice| invoice.id == id}
  end

  def find_by_customer_id(customer_id)
    invoices.select { |invoice| invoice.customer_id == customer_id}
  end

  def find_by_merchant_id(merchant_id)
    invoices.select { |invoice| invoice.merchant_id == merchant_id}
  end

  def find_by_status(status)
    invoices.select { |invoice| invoice.status == status}
  end

  def find_by_created_at(created_at)
    invoices.select {|invoice| invoice.created_at == created_at}
  end

  def find_by_updated_at(updated_at)
    invoices.select {|invoice| invoice.updated_at == updated_at}
  end

  def find_all_by_customer(customer_id)
    invoices.select { |invoice| invoice.customer_id == customer_id}.size
  end

  def random
    invoices.sample
  end

  def find_all_by_customer(id)
    customer.select { |invoice| customer.id == id}
  end

end
