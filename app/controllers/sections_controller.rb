class SectionsController < ApplicationController
	before_action :set_project
	before_action :set_section, only: [:show, :edit, :update, :destroy]

	def index
		@section = Section.all
	end

	def show
	end

	def new
		@section = Section.new
		@section.project = @project

  		respond_to do |format|
#   		format.html { render partial: 'sections/new'}
		  #  format.html { @content = render_to_string(partial: 'sections/new')}
		    format.js { render layout: false, partial: 'sections/new' }
		end
	end

	def create
		@section = Section.new(section_params)
		@section.project_id = @project.id
		@section.save
		redirect_to @project
	end

	def update
		if @section.update(section_params)
          redirect_to project_section_path(@project, @section)
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
	end

	def section_params
		params.require(:section).permit(:title, :commencement_day, :duration)
	end
end
