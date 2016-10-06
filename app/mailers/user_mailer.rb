class UserMailer < ApplicationMailer
	default from: 'maneeshapv95@gmail.com'
	def admin_sign_up_mail(admin)
		@admin = admin
		#@hotel = hotel
		mail(to: @admin.email,subject: 'New hotel allocation')
	end
	def booking_confirm_email(admin, booking)
		@admin = admin
		@booking = booking
		mail(to: @admin.email,subject: 'Booking confirmation email')
	end
end
