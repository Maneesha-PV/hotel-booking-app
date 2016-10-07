class RoomTypeController < ApplicationController

	def new
		@room_type = RoomType.new
	end
	def create
		@room_type = RoomType.new(secure_params)
		@room_type.admin_id = current_admin.id
		if @room_type.save
			render plain: "created room type"
		end
	end
	def index
		@room_type = RoomType.all
		#@rooms_available = Room.where('(room_type_select =? )',id).count - Booking.where('(room_type_id =? AND check_in_date >= ? )',id,Time.now ).count
	end
	private
		def secure_params
			 params.require(:room_type).permit(:room_type, :description, :availabilty)
  	end
end