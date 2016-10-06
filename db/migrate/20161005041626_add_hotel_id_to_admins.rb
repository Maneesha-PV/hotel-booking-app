class AddHotelIdToAdmins < ActiveRecord::Migration[5.0]
  def change
    add_column :admins, :hotel_id, :integer
  end
end
