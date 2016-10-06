class AddAdminIdToBookings < ActiveRecord::Migration[5.0]
  def change
    add_column :bookings, :admin_id, :integer
  end
end
