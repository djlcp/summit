class CreateSections < ActiveRecord::Migration[5.2]
  def change
    create_table :sections do |t|
    	t. string :title, index: true
    	t. integer :commencement_day
    	t. integer :duration
      t.timestamps
    end
  end
end
