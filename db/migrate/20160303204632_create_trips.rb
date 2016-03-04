class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.string :name, null: false
      t.date :date

      t.timestamps null: false
    end
  end
end
