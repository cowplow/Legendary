class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.boolean :win
      t.integer :players
      t.timestamps
    end
  end
end
