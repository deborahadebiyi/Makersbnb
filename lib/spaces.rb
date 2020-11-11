require 'pg'

class Space

  attr_reader :name, :description, :price, :date, :availability

  def initialize(name:, description:, price:, date:, availability:)
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
    result.map { |space| space['name']}

  end

  def self.create_space(name:, description:, price:, date:, availability:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'makersbnb_test')
    else
      connection = PG.connect(dbname: 'makersbnb')
    end

    connection.exec("INSERT INTO spaces(name, description, price, date, availability) VALUES('#{name}', '#{description}', '#{price}', '#{date}', '#{availability}')")
  end
#refactor to create_space

  def self.is_available?

  end
end