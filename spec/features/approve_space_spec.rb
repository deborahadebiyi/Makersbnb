require './lib/user'
require './lib/space'

feature 'approving a space' do
  scenario 'host can view all booking requests' do
    sign_up('test', 'test')
    log_in('test', 'test')
    click_button 'Approve a space'
    expect(page).to include User.check_bookings(user_id: space['user_id'])
  end

  scenario 'host approves a booking' do
    sign_up('test', 'test')
    log_in('test', 'test')
    click_button 'Approve a space'
    fill_in with: 'booking_id: 1'
    #expect(Space.approve(booking_id: booking['booking_id')).to
  end

  scenario 'approved booking changes state of space to true' do

  end

  scenario 'approved space no longer listed with pending requests' do

  end
end
