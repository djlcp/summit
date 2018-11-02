class DropCommentsTable < ActiveRecord::Migration[5.2]
  def up
  	drop_table :comments
  end

  def down
  	raise ActiveRecord::IrreversibleMigration
  end
end
