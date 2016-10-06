class BookingController < ApplicationController
	def new
		@booking = Booking.new
	end
	def create
		@booking = Booking.new(booking_params)
		@booking.admin_id = current_admin.id
		if @booking.save
			UserMailer.booking_confirm_email(current_admin,@booking).deliver_now!
			render plain: "Booking successful"
		end
	end
	def show
		@booking = Booking.all
	end
	private
		def booking_params
			params.require(:booking).permit(:check_in_date, :check_out_date, :number_of_children,:number_of_guest)
		end
end
