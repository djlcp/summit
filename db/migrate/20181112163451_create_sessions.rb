class CreateSessions < ActiveRecord::Migration[5.2]
  def change
    create_table :sessions do |t|
    	t.string :title, index: true
    	t.integer :session_no, index: true
    	t.integer :project_id, index: true


      t.timestamps
    end
  end
end
