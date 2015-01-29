class CreateGameExpansions < ActiveRecord::Migration
  def change
    create_table :game_expansions do |t|
      t.integer :game_id, :expansion_id
      t.timestamps
    end
  end
end
