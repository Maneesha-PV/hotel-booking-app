class CreateHotels < ActiveRecord::Migration[5.0]
  def change
    create_table :hotels do |t|
      t.string :name
      t.integer :number_of_rooms

      t.timestamps
    end
  end
end
