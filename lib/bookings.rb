class Booking
    attr_reader :id, :space_id, :host_id, :user_id, :approval

    def initialize(id, space_id, host_id, user_id, approval)
        @id = id
        @space_id = space_id
        @host_id = host_id
        @user_id = user_id
        @approval = approval
    end 
end 