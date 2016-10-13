class AddAvailabiltyToRoomTypes < ActiveRecord::Migration[5.0]
  def change
    add_column :room_types, :availabilty, :string
  end
end
