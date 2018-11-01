class SectionsController < ApplicationController
	before_action :set_project

	def index
		@section = section.all
	end

	# def show
	# 	set_section
	# end

	def new
		@section = Section.new
		@section.project = @project.id
	end

	def create
		@section = Section.new(section_params)
		@section.project_id = @project.id
		@section.save
		redirect_to @project
	end

	# def update
	# 	if @section.update(section_params)
 #          format.html { redirect_to @project, notice: 'section was saved successfully.' }
 #        else
 #          format.html { render :edit, notice: 'section not saved.' }
 #        end
	# end

	# def edit
	# 	set_section
	# end

	# def destroy
	# 	@section.destroy
	# 	redirect_to @project
	# end

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
