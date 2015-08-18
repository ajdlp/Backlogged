class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :title
      t.string :boxart
      t.string :platform
      t.string :release_year

      t.timestamps null: false
    end
  end
end
