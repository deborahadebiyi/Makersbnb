require 'pg'

class Space

  attr_reader :name, :desc, :price, :dates_available

  def initialize(name, desc, price, dates_available)
    @name = name
    @desc = desc
    @price = price
    @dates_available = dates_available
  end

  def self.all

  end

  def self.create_space

  end

  def self.is_available?
    
  end
end
