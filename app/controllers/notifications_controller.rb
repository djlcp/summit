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

	def destroy_all
		@notifications = current_user.notifications
		@notifications.destroy_all
		refresh_dropdown
	end

	def read_all
		@notifications = current_user.notifications
		@notifications.each do |notification|
			notification.read_at = DateTime.now
			notification.save
		end
		refresh_dropdown
	end

	private

	def refresh_dropdown
		respond_to do |format|
		  format.js {render layout: false, partial: 'show'}
		end
	end
end
