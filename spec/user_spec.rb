require 'user'

RSpec.describe User do
  describe '#sign_up' do
    it "returns true if the user succesfully signs up" do
      expect(User.sign_up(username: "test", password: "test")).to be true
    end
  end
  describe '.all' do
    it "returns all the users" do
      User.sign_up(username: "test", password: "test")
      expect(User.all.length).to eq 1
    end
  end
  describe '#log_in' do
    it "user is able to log in if the username and password are correct" do
      User.sign_up(username: "test", password: "test")
      expect(User.log_in(username: "test", password: "test")).to be true
    end
    it "returns false if the username doesnt exist" do
      expect(User.log_in(username: "test", password: "test")).to be false
    end
    it "returns false if the password is incorrect" do
      User.sign_up(username: "test", password: "test")
      expect(User.log_in(username: "test", password: "jeff")).to be false
    end
  end

  describe '#find_user' do 
    it 'finds and return an object of the user using its id' do 
      User.sign_up(username: "test", password: "test")
      user = User.find_user(id: User.current_user)
      expect(user.username).to eq "test"
    end 
  end 
end
