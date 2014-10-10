require_relative '../classes/item'
require_relative '../parsers/item_parser'


class ItemRepository

  attr_reader :items, :sales_engine

  def inspect
    "#<#{self.class} #{@merchants.size} rows>"
  end

  def initialize(sales_engine, filepath)
    @items = ItemParser.new.create_items(self, filepath)
    @sales_engine = sales_engine
  end

  def find_by_id(id)
    items.find { |item| item.id == id}
  end

  def find_by_name(name)
    items.find { |item| item.name == name}
  end

  def find_by_description(description)
    items.find { |item| item.description == description}
  end

  def find_by_unit_price(unit_price)
    items.find { |item| item.unit_price == unit_price}
  end

  def find_by_merchant_id(merchant_id)
    items.find { |item| item.merchant_id == merchant_id}
  end

  def find_by_created_at(created_at)
    items.find {|item| item.created_at == created_at}
  end

  def find_by_updated_at(updated_at)
    items.find {|item| item.updated_at == updated_at}
  end

  def find_all_by_name(name)
    items.select { |item| item.name == name}
  end

  def find_invoice_items_from(item_id)
    sales_engine.invoice_item_repository.find_all_by_invoice_id(item_id).size

  end

  def random
    items.sample
  end

  def find_merchants_from(id)
    # require "pry";binding.pry
    sales_engine.merchant_repository.find_by_id(id)
  end

end
