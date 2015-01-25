class CreateScenarios < ActiveRecord::Migration
  def change
    create_table :scenarios do |t|
      t.belongs_to :game
      t.belongs_to :set
      t.string :name
      t.text :description
    end
  end
end
