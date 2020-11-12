require 'pg'
require_relative 'database_connection'
require_relative 'bookings'

class User
  attr_reader :id,:username
  @current_user

  def initialize(id, username)
    @id = id
    @username = username
  end

  def self.sign_up(username:, password:)
    return false if self.name_taken(username: username)
    DatabaseConnection.query("INSERT INTO users (username,password) VALUES ('#{username}','#{password}')")
    self.log_in(username: username, password: password)
    return true
  end

  def self.log_in(username:, password:)
    return false if !self.name_taken(username: username)
    result = DatabaseConnection.query("SELECT * FROM users WHERE username LIKE '#{username}' AND password LIKE '#{password}'")
    if result.ntuples != 0
      @current_user = result[0]['id']
      true
    else
      false
    end
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM users")
    result.map do |user|
      User.new(user['id'],user['username'])
    end
  end

  def self.find_user(id:)
    result = DatabaseConnection.query("SELECT * FROM users WHERE id = '#{id}'")
    User.new(result[0]['id'], result[0]['username'])
  end

  def self.current_user
    @current_user
  end

  def self.show_approvals(id:)
    result = DatabaseConnection.query("SELECT * FROM bookings WHERE host_id = #{id} AND approval = false")
    result.map do |booking|
      Booking.new(booking['booking_id'], booking['space_id'], booking['host_id'], booking['user_id'], booking['approval'])
    end
  end
  private

  def self.name_taken(username:)
    result = self.all
    result.each do |user|
      return true if user.username == username
    end
    return false
  end

end
