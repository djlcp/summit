class StepsController < ApplicationController
	before_action :set_task
	before_action :set_section
	before_action :set_project
	before_action :set_step, only: [:show, :edit, :destroy, :update]

	def show
	end

	def new
		@step = Step.new
		@step.task = @task
	end

	def create
		@step = Step.new(step_params)
		@step.task = @task
		@step.save
		redirect_to project_section_task_path(@project, @section, @task)
	end

	def update
		if @step.update(step_params)
	         redirect_to project_section_task_path(@project, @section, @task)
	       else
	         format.html { render :edit, notice: 'section not saved.' }
 	  end
	end

	def edit
	end

	def destroy
		@step.destroy
		redirect_to project_section_task_path(@project, @section, @task)
	end

	private

	def set_section
		@section = @task.section
	end

	def set_project
		@project = @section.project 
	end

	def set_task
		@task = Task.find(params[:task_id])
	end

	def set_step
		@step = Step.find(params[:id])
	end

	def step_params
		params.require(:step).permit(:title, :description)
	end
end
