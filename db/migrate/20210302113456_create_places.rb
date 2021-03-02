class CreatePlaces < ActiveRecord::Migration[6.1]
  def change
    create_table :places do |t|
      t.string :name
      t.string :category
      t.float :lat
      t.float :lng
      t.text :description
      t.string :link_url

      t.timestamps
    end
  end
end
