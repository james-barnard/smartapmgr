# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
home = Location.create name: "BA Home", address1: "6207 S 296th East Ave", address2: "", city: "Broken Arrow", state: "OK", zip: "74014", contact: "", contact_phone: "720-317-8000"
owner = Owner.create name: 'James Barnard', location: home
home.update owner_id: owner.id

brew = Product.create name: "NitroKaffeNo9", brewer: "james", sku: "100010"

machine = owner.machines.create serial_number: "100001", device_id: "abcdefg", version: "0.1", meter_count: 2
load = machine.loads.create loaded_at: Time.now, ounces: 384, meter_number: 1, product: brew
(3+rand*8).round.times.each do |n|
  machine.record_tick 1, ((8+rand*3)*153).round
  sleep 4
end

location = Location.create name: 'Kafepub', address1: "6207 S 296th East Ave", address2: "", city: "Broken Arrow", state: "OK", zip: "74014", contact: "", contact_phone: "720-317-8000"
placement = machine.placements.create location_id: location.id, placed_at: Time.now
#
(1..10).each do |i|
  puts "generating machines, loads, ticks, pours, locations, and placements for #{i}"
  machine = owner.machines.create serial_number: "100#{i*10+1}", device_id: "abcdefg", version: "0.1", meter_count: 2
  load1 = machine.loads.create loaded_at: Faker::Date.between(3.days.ago, Date.today) , ounces: 384, meter_number: 1, product: brew
  load2 = machine.loads.create loaded_at: Faker::Date.between(5.days.ago, Date.today) , ounces: 384, meter_number: 2, product: brew
  (3+rand*8).round.times.each do |n|
    machine.record_tick 1, ((8+rand*3)*153).round
    sleep 4
  end
  (2+rand*8).round.times.each do |n|
    machine.record_tick 2, ((8+rand*3)*153).round
    sleep 4
  end
  machine.locations.create(
    owner_id: owner.id,
    address1: Faker::Address.street_address,
    city:     Faker::Address.city,
    state:    Faker::Address.state_abbr,
    zip:      Faker::Address.zip
  )
  Placement.all.each do |p|
    p.update placed_at: Faker::Date.between(20.days.ago, Date.today)
  end
end
