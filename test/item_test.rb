require 'simplecov'
SimpleCov.start
require_relative 'test_helper'
require_relative "../lib/item"

class ItemTest < Minitest::Test

  attr_reader :item

  def setup

    @data = {
      id: '15',
      name: 'Item Autem Minima',
      description: 'Nihil autem sit odio inventore deleniti. Est laudantium ratione distinctio laborum. Minus voluptatem nesciunt assumenda dicta voluptatum porro.',
      unit_price: '75107',
      merchant_id: '53',
      created_at: '2012-03-27 14:54:11 UTC',
      updated_at: '2012-03-27 14:54:11 UTC'
    }

    @item = Item.new(@data)

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

end
