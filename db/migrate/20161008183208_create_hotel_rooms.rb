class CreateHotelRooms < ActiveRecord::Migration[5.0]
  def change
    create_table :hotel_rooms do |t|
      t.string :name
      t.integer :max_adults
      t.integer :max_children
      t.references :hotel_category, foreign_key: true

      t.timestamps
    end
  end
end
