class HotelController < ApplicationController
	def index
		@hotel = Hotel.all
	end
	def new
    @hotel = Hotel.new
  end
  def create
  	@hotel = Hotel.new(hotel_params)
   	if @hotel.save
     	redirect_to new_admin_path(hotel_id: @hotel)
  	end
 	end
  private
 	def hotel_params
 		params.require(:hotel).permit(:name, :number_of_rooms)
	end
end
