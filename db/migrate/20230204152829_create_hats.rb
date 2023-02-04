class CreateHats < ActiveRecord::Migration[7.0]
  def change
    create_table :hats do |t|
      t.integer :size
      t.string :location
      t.string :type
      t.string :color
      t.text :description
      t.float :day_rate

      t.timestamps
    end
  end
end
