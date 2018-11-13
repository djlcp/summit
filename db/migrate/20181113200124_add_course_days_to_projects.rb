class AddCourseDaysToProjects < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :course_days, :integer
  end
end
