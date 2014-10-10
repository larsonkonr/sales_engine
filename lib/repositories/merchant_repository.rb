require_relative '../classes/merchant'
require_relative '../parsers/merchant_parser'

class MerchantRepository

  attr_reader :merchants, :sales_engine

  def inspect
    "#<#{self.class} #{@merchants.size} rows>"
  end

  def initialize(sales_engine, filepath)
    @merchants = MerchantParser.new.create_merchants(self, filepath)
    @sales_engine = sales_engine
  end

  def find_by_id(id)
    merchants.find { |merchant| merchant.id == id}
  end

  def find_by_name(name)
    merchants.find { |merchant| merchant.name == name}
  end

  def find_by_created_at(created_at)
    merchants.find {|merchant| merchant.created_at == created_at}
  end

  def find_by_updated_at(updated_at)
    merchants.find {|merchant| merchant.updated_at == updated_at}
  end

  def find_all_by_name(name)
    merchants.select {|merchant| merchant.name == name}
  end

  def find_invoices_from(merchant_id)
    sales_engine.invoice_repository.find_all_by_merchant_id(merchant_id)
  end

  def random
    merchants.sample
  end

end
