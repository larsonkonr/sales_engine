require "bigdecimal"
class Item
  attr_reader :repository

  ATTRIBUTES = [:id,
                :name,
                :description,
                :merchant_id,
                :unit_price,
                :created_at,
                :updated_at]

  attr_reader *ATTRIBUTES

  def initialize(data, repository)
    @id             = data[:id].to_i
    @name           = data[:name]
    @description    = data[:description]
    @unit_price     = BigDecimal.new(data[:unit_price])
    @merchant_id    = data[:merchant_id].to_i
    @created_at     = data[:created_at]
    @updated_at     = data[:updated_at]
    @repository     = repository
  end

  def merchants
    repository.find_merchants_from(merchant_id)
  end

  def invoice_items
    repository.find_invoice_items_from(id)
  end

  def merchant
    repository.find_merchants_from(merchant_id)
  end

  def total_revenue
    #unit_price of each invoice item * the quantity == sum
  end
end
