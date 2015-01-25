class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.timestamps
      t.string :username
      t.string :password_digest
      t.string :role
    end
  end
end
