require 'pg'
require_relative 'database_connection'

class Space

  attr_reader :name, :description, :price, :startdate, :enddate,:availability, :user_id
  @current_space
  def initialize(space_id, name, description, price, startdate, enddate, availability, user_id)
    @space_id = space_id
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
        Space.new(result[0]['space_id'], result[0]['name'], result[0]['description'], result[0]['price'], result[0]['startdate'], result[0]['enddate'], result[0]['availability'], result[0]['user_id'])
    end 

  end

  def self.create_space(name:, description:, price:, startdate:, enddate:, availability:, user_id:)
    DatabaseConnection.query("INSERT INTO spaces(name, description, price, startdate, enddate, availability, user_id) 
    VALUES('#{name}', '#{description}', '#{price}', '#{startdate}', '#{enddate}','#{availability}', '#{user_id}')")
    result = DatabaseConnection.query("SELECT * FROM spaces WHERE name LIKE '#{name}'")
    p result[0]
    @current_space = result[0]['space_id']
  end
#refactor to create_space

  def self.is_available(space_id:)
    result = DatabaseConnection.query("SELECT * FROM spaces WHERE space_id = #{space_id}")
    return true if result[0]['availability'] == true
    return false 
  end

  def self.current_space
    @current_space
  end 

  def self.find_space(space_id:)
    result = DatabaseConnection.query("SELECT * FROM spaces WHERE space_id = #{space_id}")
    Space.new(result[0]['space_id'], result[0]['name'], result[0]['description'], result[0]['price'], result[0]['startdate'], result[0]['enddate'], result[0]['availability'], result[0]['user_id'])
  end
end