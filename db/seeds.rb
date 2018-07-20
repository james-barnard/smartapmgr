# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
home = Location.create name: "BA Home", address1: "6207 S 296th East Ave", address2: "", city: "Broken Arrow", state: "OK", zip: "74014", contact: "", contact_phone: "720-317-8000"
owner = Owner.create name: 'James Barnard', location: home
machine = owner.machines.create serial_number: "100001", device_id: "abcdefg", version: "0.1", meter_count: 2
brew = Product.create name: "NitroKaffeNo9", brewer: "james", sku: "100010"
load = machine.loads.create loaded_at: Time.now, ounces: 256, meter_number: 1, product: brew
location = Location.create name: 'Kafepub', address1: "6207 S 296th East Ave", address2: "", city: "Broken Arrow", state: "OK", zip: "74014", contact: "", contact_phone: "720-317-8000"
placement = machine.placements.create location_id: location.id, placed_at: Time.now
