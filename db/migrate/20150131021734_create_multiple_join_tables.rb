class CreateMultipleJoinTables < ActiveRecord::Migration
  def change
    create_table :game_heros do |t|
      t.integer :game_id, :hero_id
      t.timestamps
    end

    create_table :game_henchmen do |t|
      t.integer :game_id, :henchman_id
      t.timestamps
    end

    create_table :game_masterminds do |t|
      t.integer :game_id, :mastermind_id
      t.timestamps
    end

    create_table :game_scenarios do |t|
      t.integer :game_id, :scenario_id
      t.timestamps
    end

    create_table :game_villainss do |t|
      t.integer :game_id, :villain_id
      t.timestamps
    end
  end
end
