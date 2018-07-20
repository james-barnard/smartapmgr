class CreateMachines < ActiveRecord::Migration[5.2]
  def change
    create_table :machines do |t|
      t.belongs_to :owner, foreign_key: true
      t.string :serial_number
      t.string :version
      t.integer :meter_count
      t.string :device_id

      t.timestamps
    end
  end
end
