class CreateMasterminds < ActiveRecord::Migration
  def change
    create_table :masterminds do |t|
      t.belongs_to :game
      t.belongs_to :set
      t.timestamps
      t.string :name
      t.string :power
      t.text :description
      t.string :slug
      t.string :lead_type
      t.string :lead_name
    end
  end
end
