class CreateSets < ActiveRecord::Migration
  def change
    create_table :sets do |t|
      t.timestamps
      t.string :name
      t.string :slug
    end
  end
end
