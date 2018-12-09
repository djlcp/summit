class LessonsController < ApplicationController
	before_action :authenticate_user!
	before_action :set_project, only: [:new, :create]
	before_action :set_lesson, only: [:edit, :update, :destroy, :show]

	def index
		@lessons = Lesson.all
		respond_to do |format|
			format.js {render layout: false, partial: 'update'}
		end
	end

	def new
		@lesson = Lesson.new
	end

	def show
	end

	def create
		@lesson = Lesson.new(lesson_params)
		@lesson.project = @project
		@lesson.save
		redirect_to new_project_lesson_path(@project, Lesson.new)
	end

	def edit
		@project = @lesson.project
	end

	def update
		if @lesson.update(lesson_params)
			redirect_to project_path(@lesson.project)
		else
			render :edit
		end
	end

	def destroy
		@project = @lesson.project
		@lesson.destroy
		redirect_to @project
	end

	private

	def lesson_params
		params.require(:lesson).permit(:title, :lesson_no)
	end

	def set_lesson
		@lesson = Lesson.find(params[:id])
	end

	def set_project
		@project = Project.find(params[:project_id])
	end
end
