class RoomAvailabilityController < ApplicationController
	def index
	end
	def new
		#@room_type = RoomType.find params[:room_type_id]
		#room_availability = RoomAvailability.new
	end
	def create
		@room_availability = RoomAvailability.new(availability_params)
		#@room_availability.room_type_id = params[:room_type_id]
		if @room_availability.save
			redirect_to room_availability_index_path
		end
	end
	def index
			@room_type = RoomType.all
      @room_type.each do |room_type| 
      	 room_type.availability = Room.where('(room_type_select =? AND admin_id =? )',room_type.id,current_admin.id).count - Booking.where('(room_type_id =? AND check_in_date >= ?  AND check_out_date <= ? AND admin_id =? )',room_type.id,RoomAvailability.last.from,RoomAvailability.last.to, current_admin.id ).count 
					
			end
		  respond_to do |format|
      	format.html # index.html.erb
      	format.json { render json: @room_type}
   		end
	end
	private
		def availability_params
			params.require(:room_availability ).permit(:from, :to)
		end
end
