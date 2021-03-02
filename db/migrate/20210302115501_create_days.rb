class CreateDays < ActiveRecord::Migration[6.1]
  def change
    create_table :days do |t|
      t.references :itinerary, null: false, foreign_key: true
      t.references :morning, null: true
      t.references :lunch, null: true
      t.references :afternoon, null: true
      t.references :dinner, null: true
      t.references :evening, null: true

      t.timestamps
    end
    add_foreign_key :days, :places, column: :morning_id, primary_key: :id
    add_foreign_key :days, :places, column: :lunch_id, primary_key: :id
    add_foreign_key :days, :places, column: :afternoon_id, primary_key: :id
    add_foreign_key :days, :places, column: :dinner_id, primary_key: :id
    add_foreign_key :days, :places, column: :evening_id, primary_key: :id
  end
end
