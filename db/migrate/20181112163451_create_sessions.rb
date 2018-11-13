class CreateSessions < ActiveRecord::Migration[5.2]
  def change
    create_table :lessons do |t|
    	t.string :title, index: true
    	t.integer :lesson_no, index: true
    	t.integer :project_id, index: true


      t.timestamps
    end
  end
end
