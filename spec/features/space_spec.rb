require 'space'

describe Space do
  it 'responds to method .all' do
    expect(Space).to respond_to(:all)
  end

  it 'responds to method .create_space' do
    expect(Space).to respond_to(:create_space)
  end
end
