class RemoveAnswerIdFromQuestion < ActiveRecord::Migration[5.2]
  def change
  	 remove_column :questions, :answer_id, :integer
  end
end
