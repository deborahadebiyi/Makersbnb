require 'spaces'
require 'user'

describe Space do
  it 'responds to method .all' do
    expect(Space).to respond_to(:all)
  end

  describe '.all' do
    it 'list all spaces' do
      User.sign_up(username: 'test', password: 'test')
      Space.create_space(name: 'The house', description: 'This house is amazing!', price: 123.30, startdate: '2020-11-10', enddate: '2020-11-17', availability: true, user_id: User.current_user)
      spaces = Space.all
      expect(spaces.first.name).to eq 'The house'
    end
  end
  #need to see all the arguments displayed

  describe '.create_space' do
     it 'creates a new space' do
        User.sign_up(username: 'test', password: 'test')
        Space.create_space(name: 'The house', description: 'This house is amazing!', price: 123.30, startdate: '2020-11-10', enddate: '2020-11-17', availability: true, user_id: User.current_user)
        space = Space.all
        expect(space.length).to eq 1
    end
  end

  describe '.find_space' do
    it 'finds a space' do
      User.sign_up(username: 'test', password: 'test')
      Space.create_space(name: 'The house', description: 'This house is amazing!', price: 123.30, startdate: '2020-11-10', enddate: '2020-11-17', availability: true, user_id: User.current_user)
      space = Space.find_space(space_id: Space.current_space)
      expect(space.name).to eq 'The house'
    end
  end

  describe '.book' do
    it 'changes the availability to false and inserts space into booking table' do
      User.sign_up(username: 'test', password: 'test')
      Space.create_space(name: 'The house', description: 'This house is amazing!', price: 123.30, startdate: '2020-11-10', enddate: '2020-11-17', availability: true, user_id: User.current_user)
      Space.book(space_id: Space.current_space, user_id: User.current_user)
      space = Space.find_space(space_id: Space.current_space)
      expect(space.availability).to eq 'f'
    end
  end

  describe '.is_available' do
    it 'Checks if availability is set to true' do
      User.sign_up(username: 'test', password: 'test')
      Space.create_space(name: 'The house', description: 'This house is amazing!', price: 123.30, startdate: '2020-11-10', enddate: '2020-11-17', availability: true, user_id: User.current_user)
      space = Space.find_space(space_id: Space.current_space)
      expect(space.availability).to eq 't'
    end
  end


  it 'responds to method .create_space' do
    expect(Space).to respond_to(:create_space)
  end

  it 'responds to method .is_available' do
    expect(Space).to respond_to(:is_available)
  end
end
