class AddRoomTypeIdToBookings < ActiveRecord::Migration[5.0]
  def change
    add_column :bookings, :room_type_id, :integer
  end
end
