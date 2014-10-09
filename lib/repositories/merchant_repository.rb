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
    merchants.select { |merchant| merchant.id == id}
  end

  def find_by_name(name)
    merchants.select { |merchant| merchant.name == name}
  end

  def find_by_created_at(created_at)
    merchants.select {|merchant| merchant.created_at == created_at}
  end

  def find_by_updated_at(updated_at)
    merchants.select {|merchant| merchant.updated_at == updated_at}
  end

end
