# require 'simplecov'
# SimpleCov.start
# require_relative 'test_helper'
gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'

require_relative "../../lib/classes/item"

class ItemTest < Minitest::Test

  attr_reader :item, :repository

  def setup

    data = {
      id: '15',
      name: 'Item Autem Minima',
      description: 'Nihil autem sit odio inventore deleniti. Est laudantium ratione distinctio laborum. Minus voluptatem nesciunt assumenda dicta voluptatum porro.',
      unit_price: '75107',
      merchant_id: '53',
      created_at: '2012-03-27 14:54:11 UTC',
      updated_at: '2012-03-27 14:54:11 UTC'
    }

    @repository = Minitest::Mock.new
    @item = Item.new(data, repository)

  end

  def test_it_exists
    assert Item
  end

  def test_data
    assert_equal item.id, '15'
    assert_equal item.name, 'Item Autem Minima'
    assert_equal item.description, 'Nihil autem sit odio inventore deleniti. Est laudantium ratione distinctio laborum. Minus voluptatem nesciunt assumenda dicta voluptatum porro.'
    assert_equal item.unit_price, '75107'
    assert_equal item.merchant_id, '53'
    assert_equal item.created_at, '2012-03-27 14:54:11 UTC'
    assert_equal item.updated_at, '2012-03-27 14:54:11 UTC'
  end

  def test_it_has_a_repository
    assert item.repository
  end

  def test_it_delegates_merchants_to_repository
    repository.expect(:find_merchants_from, [], ["53"])
    item.merchants
    repository.verify
  end

  def test_it_delegates_invoices_to_repository
    repository.expect(:find_invoice_items_from, [], ["15"])
    item.invoice_items
    repository.verify
  end

end
