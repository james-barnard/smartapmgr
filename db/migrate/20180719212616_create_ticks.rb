class CreateTicks < ActiveRecord::Migration[5.2]
  def change
    create_table :ticks do |t|
      t.belongs_to :machine, foreign_key: true
      t.integer :meter_number
      t.belongs_to :pour, foreign_key: true
      t.integer :count
      t.datetime :reported_at

      t.timestamps
    end
  end
end
