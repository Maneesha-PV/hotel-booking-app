class AddRoomsAvailableToRoomTypes < ActiveRecord::Migration[5.0]
  def change
    add_column :room_types, :rooms_available, :integer
  end
end
