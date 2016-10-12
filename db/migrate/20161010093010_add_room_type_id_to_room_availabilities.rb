class AddRoomTypeIdToRoomAvailabilities < ActiveRecord::Migration[5.0]
  def change
    add_column :room_availabilities, :room_type_id, :integer
  end
end
