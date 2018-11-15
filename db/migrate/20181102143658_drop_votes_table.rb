class DropVotesTable < ActiveRecord::Migration[5.2]
  def up
  	drop_table :votes
  end

  def down
  	raise ActiveRecord::IrreversibleMigration
  end
end
