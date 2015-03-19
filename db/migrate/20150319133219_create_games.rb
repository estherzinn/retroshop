class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :name
      t.string :platform
      t.text :description
      t.integer :price
      t.boolean :availability, default: true

      t.timestamps
    end
  end
end
