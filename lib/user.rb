require 'pg'

class User
  attr_reader :id,:username

  def initialize(id, username)
    @id = id
    @username = username
  end

  def self.sign_up(username:, password:)
    return false if self.name_taken(username: username)
    connection = self.connect
    connection.exec("INSERT INTO users (username,password) VALUES ('#{username}','#{password}')")
    return true
  end

  def self.log_in(username:, password:)
    return false if !self.name_taken(username: username)
    connection = self.connect
    result = connection.exec("SELECT * FROM users WHERE username LIKE '#{username}' AND password LIKE '#{password}'")
    if result.ntuples != 0
      true
    else
      false
    end
  end

  def self.all
    connection = self.connect
    result = connection.exec("SELECT * FROM users")
    result.map do |user|
      User.new(user['id'],user['username'])
    end
  end

  private

  def self.name_taken(username:)
    connection = self.connect
    result = self.all
    result.each do |user|
      return true if user.username == username
    end
    return false
  end

  def self.connect
    if ENV["ENVIRONMENT"] == 'test'
      connection = PG.connect(dbname: 'makersbnb_test')
    else
      connection = PG.connect(dbname: 'makersbnb')
    end
  end
end
