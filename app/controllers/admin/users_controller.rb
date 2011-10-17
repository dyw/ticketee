class Admin::UsersController < Admin::BaseController
   def index
   	   @user = User.all(:order => "email")
   end
   def new
   	   @user = User.new
   end
   def create
   	   @user = User.new(params[:user])
   	   @user.admin = params[:user][:admin] == "1"
   	   if @user.save
   	   	   flash[:notice] = "User has been created."
   	   	   redirect_to amdin_users_path
   	   else
   	   	   flash[:notice] = "User has not been created."
   	   	   render :action => "new"
   	   end
   end
   def show
   end
   
   before_filter :find_user, :only => [:show, :edit, :update, :destroy]
   
   private
   def find_user
   	   @user = User.find(params[:id])
   end
end
