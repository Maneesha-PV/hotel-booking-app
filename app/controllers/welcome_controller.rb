class WelcomeController < ApplicationController
	def index
		if current_user
			if current_user.role == 'super_admin'
				redirect_to superadmin_index_path
			elsif current_user.role == 'admin'
				redirect_to userlist_index_path		
			else
				redirect_to booking_index_path	
			end
		end
		if current_admin
			redirect_to admin_index_path		
		end
	end
	def show
	end
end


