class LessonsController < ApplicationController
	before_action :set_project, only: [:new, :create]
	before_action :set_lesson, only: [:edit, :update, :destroy]

	def index
		@lessons = Lesson.all
	end

	def new
		@lesson = Lesson.new
	end

	def create
		@lesson = Lesson.new(lesson_params)
		@lesson.project = @project
		@lesson.save
		redirect_to @new_project_lesson_path(@project)
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
