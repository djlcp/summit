class TasksController < ApplicationController
	before_action :set_section

	def index
		@task = Task.all
	end

	def show
		set_task
	end

	def new
		@task = Task.new
		@task.section = @section
	end

	def create
		@task = Task.new(task_params)
		@task.section = @section
		@task.save
		redirect_to project_section_path(@section.project, @section)
	end

	# def update
	# 	if @section.update(section_params)
	#          format.html { redirect_to @project, notice: 'section was saved successfully.' }
	#        else
	#          format.html { render :edit, notice: 'section not saved.' }
 	#   end
	# end

	# def edit
	# 	set_section
	# end

	# def destroy
	# 	@section.destroy
	# 	redirect_to @project
	# end

	private

	def set_section
		@section = Section.find(params[:section_id])
	end

	def set_task
		@task = Task.find(params[:id])
	end

	def task_params
		params.require(:task).permit(:title, :days_given, :description)
	end
end

