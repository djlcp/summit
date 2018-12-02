class Step < ApplicationRecord
	belongs_to :task
	has_many :completes, dependent: :destroy
	has_many :users, through: :completes

	def complete?(user)
		user_complete = Complete.find_or_create_by(step_id: id, user_id: user.id)
		if user_complete.completed == true
			true
		else
			false
		end
	end
		
end
