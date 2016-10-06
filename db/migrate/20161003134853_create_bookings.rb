class CreateBookings < ActiveRecord::Migration[5.0]
  def change
    create_table :bookings do |t|
      t.datetime :check_in_date
      t.datetime :check_out_date
      t.integer :total_rooms
      t.integer :number_of_children
      t.integer :number_of_guest

      t.timestamps
    end
  end
end
