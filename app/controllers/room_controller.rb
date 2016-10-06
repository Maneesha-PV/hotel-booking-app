class RoomController < ApplicationController
	def new
		@room = Room.new
		@room_type = RoomType.all
		
	end
	def create
		@room = Room.new(secure_params)
		#byebug
		@room.admin_id = current_admin.id
		if @room.save
			render plain: "room created"
		end
	end
	def index
		@rooms = Room.all
		@room_type = RoomType.all

	end
	private
		def secure_params
			params.require(:room).permit(:room_number, :room_type_select)
  	end
end
