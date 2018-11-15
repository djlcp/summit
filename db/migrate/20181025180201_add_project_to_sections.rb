class AddProjectToSections < ActiveRecord::Migration[5.2]
  def change
  	add_column :sections, :project_id, :integer
  	add_index :sections, :project_id
  end
end
