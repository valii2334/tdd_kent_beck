# frozen_string_literal: true

require 'rspec'
require 'pry'

class Money
  attr_reader :amount

  def initialize(amount)
    @amount = amount
  end

  def times(multiplier, currency_class)
    currency_class.new(@amount * multiplier)
  end

  def ==(other)
    (self.class == other.class) && (@amount == other.amount)
  end
end

class Dollar < Money
  def times(multiplier)
    super(multiplier, self.class)
  end
end

class Franc < Money
  def times(multiplier)
    super(multiplier, self.class)
  end
end

# Dollar

describe 'test multiplication' do
  let(:five) { Dollar.new(5) }

  it 'multiplies' do
    expect(five.times(2)).to eq(Dollar.new(10))
    expect(five.times(3)).to eq(Dollar.new(15))
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

# Franc

describe 'test franc multiplication' do
  let(:five) { Franc.new(5) }

  it 'multiplies' do
    expect(five.times(2)).to eq(Franc.new(10))
    expect(five.times(3)).to eq(Franc.new(15))
  end
end

describe 'test equality' do
  it 'is equal' do
    expect(Franc.new(5)).to eq(Franc.new(5))
  end

  it 'is not equal' do
    expect(Franc.new(5)).to_not eq(Franc.new(6))
  end
end

# Misc

describe 'test equality' do
  it 'is not equal' do
    expect(Franc.new(5)).to_not eq(Dollar.new(5))
  end
end
