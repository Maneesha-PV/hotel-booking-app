class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  belongs_to :hotel
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:google_oauth2]
   def self.find_for_google_oauth2(access_token, signed_in_resource=nil)
    data = access_token.info
    admin =Admin.where(:provider => access_token.provider, :uid => access_token.uid ).first
    if admin
      return admin
    else
      registered_admin = Admin.where(:email => access_token.info.email).first
      if registered_admin
        return registered_admin
      else
        admin = Admin.create(name: data["name"],
          provider:access_token.provider,
          email: data["email"],
          uid: access_token.uid ,
          password: Devise.friendly_token[0,20],
        )
      end
   end
end      
end
