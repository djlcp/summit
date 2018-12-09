class SectionsController < ApplicationController
	before_action :authenticate_user!
	before_action :set_project, only: [:new, :create]
	before_action :set_section, only: [:show, :edit, :update, :destroy]

	def index
		@section = Section.all
	end

	def show
		respond_to do |format|
			format.html 
			format.js { render layout: false, partial: 'sections/show'}
		end
	end

	def new
		@section = Section.new
		@section.project = @project

  		respond_to do |format|
		    format.js { render layout: false, partial: 'sections/new' }
		end
	end

	def create
		@section = Section.new(section_params)
		@section.project = @project
		@section.save
		redirect_to @project
	end

	def update
		if @section.update(section_params)
          redirect_to section_path(@section)
        else
          format.html { render :edit, notice: 'section not saved.' }
        end
	end

	def edit
	end

	def destroy
		@section.destroy
		redirect_to @project
	end

	private

	def set_project
		@project = Project.find(params[:project_id])
	end

	def set_section
		@section = Section.find(params[:id])
		@project = @section.project
	end

	def section_params
		params.require(:section).permit(:title, :commencement_day, :duration)
	end
end
