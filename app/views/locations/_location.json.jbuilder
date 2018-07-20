json.extract! location, :id, :owner_id, :name, :address1, :address2, :city, :state, :zip, :contact, :contact_phone, :created_at, :updated_at
json.url location_url(location, format: :json)
