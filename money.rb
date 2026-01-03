# frozen_string_literal: true

require 'rspec'

class Dollar
  attr_reader :amount

  def initialize(amount)
    @amount = amount
  end

  def times(multiplier)
    Dollar.new(@amount * multiplier)
  end

  def ==(other)
    @amount == other.amount
  end
end

describe 'test multiplication' do
  let(:five) { Dollar.new(5) }

  it 'multiplies' do
    product = five.times(2)
    expect(product.amount).to eq(10)

    product = five.times(3)
    expect(product.amount).to eq(15)
  end
end

describe 'test equality' do
  it 'is equal' do
    expect(Dollar.new(5)).to eq(Dollar.new(5))
  end

  it 'is not equal' do
    expect(Dollar.new(5)).to_not eq(Dollar.new(6))
  end
end
