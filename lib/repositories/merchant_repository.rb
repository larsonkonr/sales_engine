require_relative '../merchant'

class MerchantRepository

  attr_reader :merchants

  def initialize(merchants = [])
    @merchants = merchants
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
