# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Seed Data for storing the room category and rooms information to the database
hotel_category_dictionary =  [ 
                      {
                        name: "Deluxe Rooms - Queen Size Bed",
                        price: 7000,
                        rooms: [
                          {type: "A", numbers: 1..5},
                          {type: "B", numbers: 1..5},
                          {type: "C", numbers: 1..5},
                          {type: "D", numbers: 1..5}
                        ] 
                      },
                      {
                        name: "Luxury Rooms - Queen Size Bed and Pool Facing",
                        price: 8500,
                        rooms: [
                          {type: "A", numbers: 6..10},
                          {type: "B", numbers: 6..10},
                          {type: "C", numbers: 6..10},
                          {type: "D", numbers: 6..10}
                        ] 
                      },
                      {
                        name: "Luxury Suites - King Size Bed and Pool Facing",
                        price: 12000,
                        rooms: [
                          {type: "D", numbers: 11..20},
                          {type: "E", numbers: 1..2}
                        ] 
                      },
                      {
                        name: "Presidential Suites - King Size Bed, Pool Facing with a Gym",
                        price: 20000,
                        rooms: [
                          {type: "E", numbers: 3..10}
                        ] 
                      }
                    ]

hotel_category_dictionary.each do |hotel_category_data|
  puts "Creating or Updating Hotel category"
  puts "-----------------------------------"
  hotel_category = HotelCategory.find_or_initialize_by(name: hotel_category_data[:name])
  puts "Category: #{hotel_category.name}"
  hotel_category.update_attributes(
     :price => hotel_category_data[:price]
  )
  hotel_category_data[:rooms].each do |room_data|
  puts "    Creating or Updating Hotel room"
  puts "    -------------------------------"
    room_data[:numbers].each do |room_number|
      hotel_room = HotelRoom.find_or_initialize_by(name: "#{room_data[:type]}#{room_number}")  
      puts "    Room: #{hotel_room.name}"
      hotel_room.update_attributes(
       :max_adults => 2,
       :max_children => 2,
       :hotel_category_id => hotel_category.id
      )
    end
  end


end