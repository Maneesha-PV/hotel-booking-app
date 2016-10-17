class RoomController < ApplicationController
	def new
		@room = Room.new
		@room_type = RoomType.where('(admin_id =?)',current_admin)
		
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
		@room = Room.all
		@room_type = RoomType.all
	  respond_to do |format|
      format.html # index.html.erb
      #format.json { render json: @room_type}
      format.json { render json: @room}
    end

	end
	def destroy
		@room = Room.find(params[:id])
		@room.destroy
		redirect_to action: 'index'
	end
	private
		def secure_params
			params.require(:room).permit(:room_number, :room_type_select)
  	end
end
