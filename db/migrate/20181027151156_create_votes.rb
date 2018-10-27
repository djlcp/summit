class CreateVotes < ActiveRecord::Migration[5.2]
  def change
    create_table :votes do |t|
    	t.integer :user_id
		t.integer :comment_id
		t.integer :direction

      t.timestamps
    end
  end
end
