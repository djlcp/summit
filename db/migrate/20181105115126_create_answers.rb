class CreateAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
    	t.text :content
    	t.integer :question_id, index: true
      t.timestamps
    end
  end
end
