class AddRoomTypeSelectToRooms < ActiveRecord::Migration[5.0]
  def change
    add_column :rooms, :room_type_select, :string
  end
end
