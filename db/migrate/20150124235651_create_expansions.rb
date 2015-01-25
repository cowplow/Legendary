class CreateExpansions < ActiveRecord::Migration
  def change
    create_table :expansions do |t|
      t.timestamps
      t.string :name
      t.string :slug
    end
  end
end
