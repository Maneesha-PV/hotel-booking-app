class AdminController < ApplicationController
	def index
	end
	def new
    #@admin = Admin.new
    @hotel = Hotel.find params[:hotel_id]
  end
  def create
    #byebug
  	@admin = Admin.new(secure_params)
  	@admin.hotel_id = params[:hotel_id]
  	#@admin.role = "admin"
   	if @admin.save
      UserMailer.admin_sign_up_mail(@admin).deliver_later!
     	#redirect_to room_index_path notice: "Created admin successfully"
      render action: 'show' 
    else
     	render plain: "error"
  	end
  end
  def show
    @admin = Admin.find(secure_params)
    @admin.hotel_id = params[:hotel_id]
  end
  private
  def secure_params
    params.require(:admin).permit(:email, :password, :hotel_id)
  end

end
