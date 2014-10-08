class Merchant
  attr_reader :repository

  ATTRIBUTES = [:id,
                :name,
                :created_at,
                :updated_at,]

  attr_reader *ATTRIBUTES

  def initialize(data, repository)
    @id            = data[:id]
    @name          = data[:name]
    @created_at    = data[:created_at]
    @updated_at    = data[:updated_at]
    @repository    = repository
	end

	def items
		repository.find_items_from(id)
	end

	def invoices
		repository.find_invoices_from(id)
	end
end
