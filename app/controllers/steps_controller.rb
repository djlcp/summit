class StepsController < ApplicationController
	before_action :authenticate_user!
	before_action :set_task, only: [:new, :create]
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
		redirect_to task_path(@task)
	end

	def update
		if @step.update(step_params)
	         redirect_to task_path(@task)
	       else
	         format.html { render :edit, notice: 'section not saved.' }
 	  end
	end

	def edit
	end

	def destroy
		@step.destroy
		redirect_to task_path(@task)
	end

	private

	def set_task
		@task = Task.find(params[:task_id])
	end

	def set_step
		@step = Step.find(params[:id])
		@task = @step.task
		@section = @task.section
		@project = @section.project
	end

	def step_params
		params.require(:step).permit(:title, :description, :drop)
	end
end
