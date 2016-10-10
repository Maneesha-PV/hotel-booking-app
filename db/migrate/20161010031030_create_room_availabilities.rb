class CreateRoomAvailabilities < ActiveRecord::Migration[5.0]
  def change
    create_table :room_availabilities do |t|
      t.datetime :from
      t.datetime :to

      t.timestamps
    end
  end
end
