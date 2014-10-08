require_relative '../item'

class ItemRepository

  attr_reader :items

  def initialize(items = [])
    @items = items
  end

  def find_by_id(id)
    items.select { |item| item.id == id}
  end

  def find_by_name(name)
    items.select { |item| item.name == name}
  end

  def find_by_description(description)
    items.select { |item| item.description == description}
  end

  def find_by_unit_price(unit_price)
    items.select { |item| item.unit_price == unit_price}
  end

  def find_by_merchant_id(merchant_id)
    items.select { |item| item.merchant_id == merchant_id}
  end

  def find_by_created_at(created_at)
    items.select {|item| item.created_at == created_at}
  end

  def find_by_updated_at(updated_at)
    items.select {|item| item.updated_at == updated_at}
  end

end
