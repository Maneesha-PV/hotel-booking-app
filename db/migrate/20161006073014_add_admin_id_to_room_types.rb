class AddAdminIdToRoomTypes < ActiveRecord::Migration[5.0]
  def change
    add_column :room_types, :admin_id, :integer
  end
end
