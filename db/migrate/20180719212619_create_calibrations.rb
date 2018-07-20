class CreateCalibrations < ActiveRecord::Migration[5.2]
  def change
    create_table :calibrations do |t|
      t.belongs_to :machine, foreign_key: true
      t.integer :meter_number
      t.integer :constant

      t.timestamps
    end
  end
end
