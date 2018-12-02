class CreateUsersProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :users_projects do |t|
    	t.belongs_to :user, index: true
    	t.belongs_to :project, index: true

      t.timestamps
    end
  end
end
