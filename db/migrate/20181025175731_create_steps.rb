class CreateSteps < ActiveRecord::Migration[5.2]
  def change
    create_table :steps do |t|
    	t. string :title, index: true
    	t. integer :task_id, index: true
    	t. text :description
      t.timestamps
    end
  end
end
