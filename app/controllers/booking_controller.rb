class BookingController < ApplicationController
	def new
		#@booking = Booking.new
		@room_type = RoomType.find params[:room_type_id]
	end
	def create
		@booking = Booking.new(booking_params)
		@booking.room_type_id = params[:room_type_id]
		#@booking.room_type_id =  RoomAvailability.last.room_type_id
		@booking.check_in_date = RoomAvailability.last.from
		@booking.check_out_date = RoomAvailability.last.to
		@booking.admin_id = current_admin.id
		if @booking.save
			UserMailer.booking_confirm_email(current_admin,@booking).deliver_now!
			redirect_to booking_check_path
		else
			redirect_to :back, notice: @booking.errors
		end
	end
	def show
		@booking = Booking.all
	end
	def destroy
		@booking = Booking.find(params[:id])
		@booking.destroy
		flash[:success] = "Successfully deleted"
		redirect_to action: 'show'
	end
	def check
		@booking = Booking.last
	end
	private
		def booking_params
			params.require(:booking).permit(:number_of_children,:number_of_guest)
		end
end
