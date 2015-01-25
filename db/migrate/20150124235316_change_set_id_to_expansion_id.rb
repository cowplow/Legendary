class ChangeSetIdToExpansionId < ActiveRecord::Migration
  def change
    rename_column :henchmen, :set_id, :expansion_id
    rename_column :heros, :set_id, :expansion_id
    rename_column :masterminds, :set_id, :expansion_id
    rename_column :scenarios, :set_id, :expansion_id
    rename_column :villains, :set_id, :expansion_id
  end
end
