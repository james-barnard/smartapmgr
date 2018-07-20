class CreatePours < ActiveRecord::Migration[5.2]
  def change
    create_table :pours do |t|
      t.belongs_to :load, foreign_key: true

      t.timestamps
    end
  end
end
