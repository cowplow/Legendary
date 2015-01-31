class DropGameVillainss < ActiveRecord::Migration
  def change
    drop_table :game_villainss

    create_table :game_villains do |t|
      t.integer :game_id, :villain_id
      t.timestamps
    end
  end
end
