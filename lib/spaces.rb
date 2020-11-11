require 'pg'
require_relative 'database_connection'

class Space

  attr_reader :name, :description, :price, startdate:, enddate:,:availability, :user_id

  def initialize(id:, name:, description:, price:, startdate:, enddate:, availability:, user_id:)
    @id = id
    @name = name
    @description = description
    @price = price
    @startdate = startdate
    @enddate = enddate
    @availability = availability
    @user_id = user_id

  end

  def self.all
    result = DatabaseConnection.query('SELECT * FROM spaces')
    result.map do |space| 
        Space.new(result[0]['id'], result[0]['name'], result[0]['description'], result[0]['price'], result[0]['startdate'], result[0]['enddate'], result[0]['availability'], result[0]['user_id'])
    end 

  end

  def self.create_space(name:, description:, price:, startdate:, enddate:, availability:)
    DatabaseConnection.query("INSERT INTO spaces(name, description, price, startdate:, enddate:, availability) 
    VALUES('#{name}', '#{description}', '#{price}', '#{startdate}', '#{enddate}','#{availability}')")
  end
#refactor to create_space

  def self.is_available(id:)
    result = DatabaseConnection.query("SELECT * FROM spaces WHERE id = '#{id}'")
    return true if result[0]['availability'] == true
    return false 
  end

  def self.find_space(id:)
    result = DatabaseConnection.query("SELECT * FROM users WHERE id = '#{id}'")
    Space.new(result[0]['id'], result[0]['name'], result[0]['description'], result[0]['price'], result[0]['startdate'], result[0]['enddate'], result[0]['availability'], result[0]['user_id'])
  end
end