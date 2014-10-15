ENV['TERM'] = 'wat' # pretty pride :)
require 'minitest/pride'

gem 'minitest', '~> 5.2'
require 'simplecov'; SimpleCov.start
require 'minitest/autorun'

require_relative 'repositories/customer_repository_test.rb'
require_relative 'classes/item_test.rb'
require_relative 'classes/customer_test.rb'
require_relative 'repositories/merchant_repository_test.rb'
require_relative 'classes/merchant_test.rb'
require_relative 'repositories/invoice_item_repository_test.rb'
require_relative 'classes/invoice_item_test.rb'
# require_relative 'sales_engine_test.rb'
require_relative 'repositories/invoice_repository_test.rb'
# require_relative 'test_helper.rb'
require_relative 'classes/invoice_test.rb'
require_relative 'repositories/transaction_repository_test.rb'
require_relative 'repositories/item_repository_test.rb'
require_relative 'classes/transaction_test.rb'
