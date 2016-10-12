class AddAvailabilityToRoomTypes < ActiveRecord::Migration[5.0]
  def change
    add_column :room_types, :availability, :integer
  end
end
