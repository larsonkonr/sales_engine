class Item

  ATTRIBUTES = [:id,
                :name,
                :description,
                :merchant_id,
                :unit_price,
                :created_at,
                :updated_at]

  attr_reader *ATTRIBUTES

  def initialize(data)
    @id             = data[:id]
    @name           = data[:name]
    @description    = data[:description]
    @unit_price     = data[:unit_price]
    @merchant_id    = data[:merchant_id]
    @created_at     = data[:created_at]
    @updated_at     = data[:updated_at]
  end
end
