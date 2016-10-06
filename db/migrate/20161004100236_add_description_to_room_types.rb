class AddDescriptionToRoomTypes < ActiveRecord::Migration[5.0]
  def change
    add_column :room_types, :description, :string
  end
end
