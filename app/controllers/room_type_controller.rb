class RoomTypeController < ApplicationController
	def new
		@room_type = RoomType.new
	end
	def create
		@room_type = RoomType.new(secure_params)
		if @room_type.save
			render plain: "created room type"
		end
	end
	private
		def secure_params
			 params.require(:room_type).permit(:room_type, :description, :availabilty)
  	end
end