require 'csv'

  customers = CSV.read('customers.csv')
  CSV.foreach('customers.csv') do |row|
    puts row.inspect
  end
