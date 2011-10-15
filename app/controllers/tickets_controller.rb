class TicketsController < ApplicationController
	
	def new
	    @ticket = Ticket.new
	end
	def create
	    @ticket = @project.tickets.build(params[:ticket])
	    if @ticket.save
	    	 flash[:notice] = "Ticket has been created."
	    	 redirect_to [@project, @ticket]
	    else
	    	flash[:notice] = "Ticket has not been created."
	    	render :action => "new"
	    end
	end
	
	def show
	end
	
	def edit
        end
        
        def update
            if @ticket.update_attributes(params[:ticket])
            	flash[:notice] = "Ticket has been updated."
            	redirect_to [@project, @ticket]
            else
            	flash[:notice] = "Ticket has not been updated."
            	render :acrion => "edit"
            end
        end
	
	before_filter :find_project
	before_filter :find_ticket, :only => [:show, :edit, :update, :destroy]
	
	private
	def find_project
	    @project = Project.find(params[:project_id])
	end
	def find_ticket
	    @ticket = @project.tickets.find(params[:id])
	end
end
