require 'spaces'

describe Space do
  it 'responds to method .all' do
    expect(Space).to respond_to(:all)
  end

  describe '.all' do
    it 'list all spaces' do
      Space.create_space(name: 'The house', description: 'This house is amazing!', price: 123.30, startdate: '2020-11-10', enddate: '2020-11-17', availability: true, user_id: User.current_user)
      spaces = Space.all
      expect(spaces).to include 'The house'
    end
  end
  #need to see all the arguments displayed

  #describe '.create_space' do
    # it 'creates a new space'
  #end

  describe '.find_space' do
    it 'finds a space' do
      Space.create_space(name: 'The house', description: 'This house is amazing!', price: 123.30, startdate: '2020-11-10', enddate: '2020-11-17', availability: true, user_id: User.current_user)
      space = Space.find_space(id: Space.current_space)
      expect(space.name).to eq 'The house'
    end
  end


  it 'responds to method .create_space' do
    expect(Space).to respond_to(:create_space)
  end

  it 'responds to method .is_available?' do
    expect(Space).to respond_to(:is_available?)
  end
end
