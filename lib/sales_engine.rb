require_relative 'repositories/merchant_repository'
require_relative 'repositories/item_repository'
require_relative 'repositories/invoice_repository'
require_relative 'repositories/invoice_item_repository'
require_relative 'repositories/customer_repository'
require_relative 'repositories/transaction_repository'

class SalesEngine
  attr_reader :merchant_repository,
              :invoice_repository,
              :item_repository,
              :invoice_item_repository,
              :customer_repository,
              :transaction_repository,
              :filepath,

  def initialize(filepath)
    @filepath = filepath
    @sales_engine = sales_engine
  end

  def startup
    @merchant_repository     = MerchantRepository.new(self, filepath)
    @invoice_repository      = InvoiceRepository.new(self, filepath)
    @item_repository         = ItemRepository.new(self, filepath)
    @invoice_item_repository = InvoiceItemRepository.new(self, filepath)
    @customer_repository     = CustomerRepository.new(self, filepath)
    @transaction_repository  = TransactionRepository.new(self, filepath)
  end
end
