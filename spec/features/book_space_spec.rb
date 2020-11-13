require './lib/bookings'

feature 'viewing listed spaces' do
  scenario 'all available spaces are listed' do
    
  end
end


feature 'booking a space' do
  scenario 'books a listed space' do
    sign_up('test', 'test')
    log_in('test', 'test')
    click_button 'Book a space'
    fill_in with: 'space_id'
    click_button 'Submit'
    #expect(page). to have_content 'Booking request recieved'
  end
end
