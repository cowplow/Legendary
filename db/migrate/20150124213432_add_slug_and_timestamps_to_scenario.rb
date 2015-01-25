class AddSlugAndTimestampsToScenario < ActiveRecord::Migration
  def change
    add_column :scenarios, :slug, :string
    add_column :scenarios, :created_at, :datetime
    add_column :scenarios, :updated_at, :datetime
  end
end
