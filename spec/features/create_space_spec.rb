require 'pg'

feature 'View all spaces' do
    scenario 'User views all spaces' do
        Space.create_space(name: 'The house', description: 'It is a big house', price: 134.67, date: '2020-10-2', availability: 'Available')
        visit('/spaces')
        expect(page).to have_content 'The house'
    end
end

feature 'Creates a new space' do
  scenario 'User creates a new space' do
    visit('/create_space')
    fill_in 'name', with: 'Bob'
    fill_in 'description', with: 'Condo with large windows'
    fill_in 'price', with: 450.65
    fill_in 'date', with: '2020-11-6'
    fill_in 'availability', with: 'Available'
    click_button 'Create space'
    expect(page).to have_content 'Bob'
  end
end