require 'pg'

class Space

  attr_reader :name, :description, :price, :date, :availability

  def initialize(name, description, price, date, availability)
    @name = name
    @description = description
    @price = price
    @date = date
    @availability = availability
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'makersbnb_test')
    else
      connection = PG.connect(dbname: 'makersbnb')
    end

    result = connection.exec('SELECT * FROM spaces')
    result.map { |space| space['name'] }

  end

  def self.create_space

  end

  def self.is_available?
    
  end
end
