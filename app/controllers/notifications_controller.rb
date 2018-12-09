class NotificationsController < ApplicationController
	before_action :authenticate_user!

	def index
		@notifications = Notification.where(recipient: current_user).unread
	end

	def update
		@notification = Notification.find(params[:id])
		@notification.read_at = DateTime.now
		@notification.save
		respond_to do |format|
			if @notification.notifiable.class == Question
				@question = @notification.notifiable
				format.js { render layout: false, partial: 'questions/show'}
			elsif @notification.notifiable.class == Answer
				@question = @notification.notifiable.question 
				format.js { render layout: false, partial: 'questions/show'}
			end
		end
	end
end
