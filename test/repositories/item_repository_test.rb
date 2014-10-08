# gem 'minitest', '~> 5.2'
# require 'simplecov'; SimpleCov.start
# require 'minitest/autorun'
# require 'minitest/pride'
# require 'stringio'
gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'

require_relative '../../lib/repositories/item_repository'

class ItemRepositoryTest < Minitest::Test

  def test_find_by_id
    items = [
    { id: '539', },
    { id: '529', },
    { id: '1832', },
    ].map {|row| Item.new(row)}
    assert_equal ["539"],
    ItemRepository.new(items).find_by_id("539")
    .map {|item| item.id}
  end

  def test_find_by_name
    items = [
    { name: 'Item Qui Esse', },
    { name: 'Item Provident At', },
    { name: 'Item Quo Magnam', },
    ].map {|row| Item.new(row)}
    assert_equal ["Item Quo Magnam"],
    ItemRepository.new(items).find_by_name("Item Quo Magnam")
    .map {|item| item.name}
  end

  def test_find_by_description
    items = [
    { description: 'Nihil autem sit odio inventore deleniti', },
    { description: 'Numquam officiis reprehenderit', },
    { description: 'Culpa deleniti adipisci voluptates', },
    ].map {|row| Item.new(row)}
    assert_equal ["Nihil autem sit odio inventore deleniti"],
    ItemRepository.new(items).find_by_description("Nihil autem sit odio inventore deleniti")
    .map {|item| item.description}
  end

  def test_find_by_unit_price
    items = [
    { unit_price: '75107', },
    { unit_price: '68723', },
    { unit_price: '34018', },
    ].map {|row| Item.new(row)}
    assert_equal ["34018"],
    ItemRepository.new(items).find_by_unit_price("34018")
    .map {|item| item.unit_price}
  end

  def test_find_by_merchant_id
    items = [
    { merchant_id: '1', },
    { merchant_id: '7', },
    { merchant_id: '2', },
    ].map {|row| Item.new(row)}
    assert_equal ["7"],
    ItemRepository.new(items).find_by_merchant_id("7")
    .map {|item| item.merchant_id}
  end

  def test_find_by_created_at
    items = [
    { created_at: '2012-03-27 14:54:09 UTC', },
    { created_at: '2012-03-27 14:54:11 UTC', },
    { created_at: '2012-03-27 14:54:10 UTC', },
    ].map {|row| Item.new(row)}
    assert_equal ["2012-03-27 14:54:10 UTC"],
    ItemRepository.new(items).find_by_created_at("2012-03-27 14:54:10 UTC")
    .map {|item| item.created_at}
  end

  def test_find_by_updated_at
    items = [
    { updated_at: '2012-03-27 14:54:10 UTC', },
    { updated_at: '2012-03-27 14:54:11 UTC', },
    { updated_at: '2012-03-27 14:54:09 UTC', },
    ].map {|row| Item.new(row)}
    assert_equal ["2012-03-27 14:54:09 UTC"],
    ItemRepository.new(items).find_by_updated_at("2012-03-27 14:54:09 UTC")
    .map {|item| item.updated_at}
  end
end
