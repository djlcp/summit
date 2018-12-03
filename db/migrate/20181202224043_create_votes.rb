class CreateVotes < ActiveRecord::Migration[5.2]
  def change
    create_table :votes do |t|
    	t. integer :user_id, index: true
    	t. integer :post_id, index: true
    	t. string :post_type
    	t. integer :direction

      t.timestamps
    end
  end
end
