class AddLocationIdToOwner < ActiveRecord::Migration[5.2]
  def change
    remove_column :owners, :location
    add_column :owners, :location_id, :integer
  end
end
