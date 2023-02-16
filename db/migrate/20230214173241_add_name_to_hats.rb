class AddNameToHats < ActiveRecord::Migration[7.0]
  def change
    add_column :hats, :name, :string
  end
end
