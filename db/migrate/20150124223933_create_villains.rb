class CreateVillains < ActiveRecord::Migration
  def change
    create_table :villains do |t|
      t.timestamps
      t.belongs_to :game
      t.belongs_to :set
      t.string :name
      t.string :slug
    end
  end
end
