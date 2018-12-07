class User < ApplicationRecord
	has_many :users_projects, dependent: :destroy
	has_many :projects, :through => :users_projects
	has_many :completes, dependent: :destroy
	has_many :steps, through: :completes
	has_many :questions, dependent: :destroy
	has_many :answers, dependent: :destroy
	has_many :comments, dependent: :destroy
  has_one :profile, dependent: :destroy
  has_many :votes, dependent: :destroy
  has_many :notifications, foreign_key: :recipient_id, dependent: :destroy
		
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :invitable

    def tasks
    	all_tasks_array = []
    	projects.each do |project|
        steps.each do |step|
    		  all_tasks_array << step.task
      	end
      end
    	tasks_array = all_tasks_array.uniq
    	tasks_array.sort_by { |task| task.deadline }
    end

    def admin? 
      admin == true
    end

end
