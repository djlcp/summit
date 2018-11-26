class TasksController < ApplicationController
	before_action :set_section
	before_action :set_project
	before_action :set_task, only: [:show, :edit, :destroy, :update]

	def index
		@task = Task.all
	end

	def show
	end

	def new
		@task = Task.new
		@task.section = @section

  		respond_to do |format|
		    format.js { render layout: false, partial: 'tasks/new' }
		end
	end

	def create
		@task = Task.new(task_params)
		@task.section = @section
		@task.save
		redirect_to project_section_path(@project, @section)
	end

	def update
		if @task.update(task_params)
	         redirect_to project_section_path(@project, @section)
	       else
	         format.html { render :edit, notice: 'section not saved.' }
 	  end
	end

	def edit
	end

	def destroy
		@task.destroy
		redirect_to project_section_path(@project, @section)
	end

	private

	def set_section
		@section = Section.find(params[:section_id])
	end

	def set_project
		@project = @section.project 
	end

	def set_task
		@task = Task.find(params[:id])
	end

	def task_params
		params.require(:task).permit(:title, :days_given, :description)
	end
end

