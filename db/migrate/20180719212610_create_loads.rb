class CreateLoads < ActiveRecord::Migration[5.2]
  def change
    create_table :loads do |t|
      t.belongs_to :machine, foreign_key: true
      t.integer :meter_number
      t.belongs_to :product, foreign_key: true
      t.integer :ounces
      t.datetime :loaded_at
      t.datetime :removed_at

      t.timestamps
    end
  end
end
