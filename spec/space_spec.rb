require 'spaces'

describe Space do
  it 'responds to method .all' do
    expect(Space).to respond_to(:all)
  end

  describe '.all' do
    it 'list all spaces' do
      connection = PG.connect(dbname: 'makersbnb_test')
      connection.exec("INSERT INTO spaces (name, description, price, date, availability) VALUES ('The house', 'This is a big house', 123.50, '2020-11-06', 'Available');")
      spaces = Space.all
      expect(spaces).to include 'The house'
    end
  end
  #need to see all the arguments displayed

  #describe '.create_space' do
    # it 'creates a new space'
  #end


  it 'responds to method .create_space' do
    expect(Space).to respond_to(:create_space)
  end

  it 'responds to method .is_available?' do
    expect(Space).to respond_to(:is_available?)
  end
end