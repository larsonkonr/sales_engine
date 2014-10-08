class Merchant

  ATTRIBUTES = [:id,
                :name,
                :created_at,
                :updated_at]

  attr_reader *ATTRIBUTES

  def initialize(data)
    @id            = data[:id]
    @name          = data[:name]
    @created_at    = data[:created_at]
    @updated_at    = data[:updated_at]
  end
end
