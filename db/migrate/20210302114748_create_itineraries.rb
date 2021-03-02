class CreateItineraries < ActiveRecord::Migration[6.1]
  def change
    create_table :itineraries do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title
      t.integer :duration
      t.string :city

      t.timestamps
    end
  end
end
