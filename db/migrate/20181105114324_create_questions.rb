class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
    	t.string :title, index: true
    	t.text :content
    	t.integer :answer_id, index: true
      t.timestamps
    end
  end
end
