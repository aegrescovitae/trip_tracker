class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :street
      t.string :state
      t.string :zip
      t.belongs_to :location

      t.timestamps null: false
    end
  end
end
