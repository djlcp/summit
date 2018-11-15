class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
    	t. string :title, index: true
   		t. integer :section_id, index: true
    	t. integer :days_given
    	t. text :description
      t.timestamps
    end
  end
end
