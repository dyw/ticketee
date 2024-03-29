class ProjectsController < ApplicationController
	def index
            @projects = Project.all
	end
	def new
	    @project = Project.new
	end
	def create
	    @project = Project.new(params[:project])
	    if @project.save
	      flash[:notice] = "Project has been created."
	      redirect_to @project
	    else
	      flash[:alert] = "Project has not been created."
	      render :action => "new"
	    end
	end
	def show
	    find_project #@project = Project.find(params[:id])
	end
	def edit
	    find_project #@project = Project.find(params[:id])
	end
	def update
	    find_project #@project = Project.find(params[:id])
	    if @project.update_attributes(params[:project])
	        flash[:notice] = "Project has been updated."
	        redirect_to @project
	    else
	    	flash[:notice] = "Project has not been updated."
	    	render :action => "edit"
	    end
	end
	def destroy
	    find_project # @project = Project.find(params[:id])
	    @project.destroy
	    flash[:notice] = "The Project has been deleted."
	    redirect_to projects_path
	end
	
	# before_filter :authorize_admin!, :except => [:index, :show]
	before_filter :authenticate_user!, :only => [:show]
	before_filter :find_project, :only => [:show, :edit, :update, :destroy]
	
	
	def find_project
	     @project = Project.readable_by(current_user).find(params[:id])
	    
	end
	
	
end
