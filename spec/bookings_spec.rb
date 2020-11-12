require 'bookings'
require 'spaces'
require 'user'

RSpec.describe Booking do 
    describe '#approve' do 
        it 'approves the booking by changing approval to true' do 
            User.sign_up(username: 'test', password: 'test')
            Space.create_space(name: 'The house', description: 'This house is amazing!', price: 123.30, startdate: '2020-11-10', enddate: '2020-11-17', availability: true, user_id: User.current_user) 
            Space.book(space_id: Space.current_space, user_id: User.current_user)
            expect(Booking.approve(booking_id:Booking.find_booking_id(space_id: Space.current_space))).to eq true
        end 
    end 
    describe '#check_bookings' do 
        it 'shows all the bookings the user has made' do 
            User.sign_up(username: 'test', password: 'test')
            Space.create_space(name: 'The house', description: 'This house is amazing!', price: 123.30, startdate: '2020-11-10', enddate: '2020-11-17', availability: true, user_id: User.current_user) 
            Space.book(space_id: Space.current_space, user_id: User.current_user)
            bookings = Booking.check_bookings(user_id: User.current_user)
            expect(bookings.length).to eq 1
        end 
    end 
end 