class CreatePlacements < ActiveRecord::Migration[5.2]
  def change
    create_table :placements do |t|
      t.belongs_to :location, foreign_key: true
      t.belongs_to :machine, foreign_key: true
      t.datetime :placed_at
      t.datetime :removed_at

      t.timestamps
    end
  end
end
