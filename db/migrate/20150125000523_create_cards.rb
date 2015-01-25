class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.timestamps
      t.belongs_to :hero
      t.belongs_to :villain
      t.string :name
      t.text :description
    end
  end
end
