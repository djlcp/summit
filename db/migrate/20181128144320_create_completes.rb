class CreateCompletes < ActiveRecord::Migration[5.2]
  def change
    create_table :completes do |t|

    t.integer :user_id, index: true
    t.integer :step_id, index: true
    t.boolean :completed, default: true

      t.timestamps
    end
  end
end
