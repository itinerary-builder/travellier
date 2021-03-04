class AddNameToDays < ActiveRecord::Migration[6.1]
  def change
    add_column :days, :name, :string
  end
end
