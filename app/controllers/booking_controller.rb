class BookingController < ApplicationController
	#before_action :if_another_booking_exist
	def new
		#@booking = Booking.new
		@room_type = RoomType.find params[:room_type_id]
	end
	def create
		@booking = Booking.new(booking_params)
		@booking.room_type_id = params[:room_type_id]
		@booking.admin_id = current_admin.id
		if @booking.save
			UserMailer.booking_confirm_email(current_admin,@booking).deliver_now!
			render plain: "Booking successful"
		else
			redirect_to :back, notice: @booking.errors
		end
	end
	def check
		@booking = Booking.all
	end
	def show
		@booking = Booking.all
		#count = Booking.where.not("check_in_date <= ? AND check_out_date >= ?", end_date, start_date)
	end
	def destroy
		@booking = Booking.find(params[:id])
		@booking.destroy
		flash[:success] = "Successfully deleted"
		redirect_to action: 'show'
	end
	private
		def booking_params
			params.require(:booking).permit(:check_in_date, :check_out_date, :number_of_children,:number_of_guest)
		end
end
