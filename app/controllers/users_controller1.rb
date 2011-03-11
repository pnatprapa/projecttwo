class UsersController < ApplicationController
#####			NEW			#####
  def new
  end
#######################
#####			EDIT			#####
  def edit
  	#Find users through unique id
  	@user = User.find(params[:id]
  end
#########################
#####			INDEX			#####
  def index
  	#List all users
  	@users = User.all
  end
#########################
#####			CREATE			#####
	def create
		#Assigning data
		first_name = params[:user][:first_name]
    last_name = params[:user][:last_name]
    email = params[:user][:email]
    division = params[:user][:div]
    department = params[:user][:dep]
    username = params[:user][:username]
    password = params[:user][:password]
    conn = ActiveRecord::Base.connection
    #sql insert into users_view
    sql = "insert into users_view (first_name,last_name,email,div,dep,username,password) " +
    	"values ('" + first_name + "','" + last_name + "','" + email + "','" + username + "', '" + 
    	password + "','" + department + "','" + division + "')"
    conn.insert(sql)
    #redirect user to the main page
    redirect_to :controller => "users", :action => "index"
	end
###########################
#####			UPDATE PAGE			#####
	def update
		#User at this id
    @user = User.find(params[:user][:id])
    if @user.update_attributes(:first_name => params[:user][:first_name],
      :last_name => params[:user][:last_name],
      :email => params[:user][:email],
      :username => params[:user][:username],
      :dep => params[:user][:dep],
      :div => params[:user][:div])
      redirect_to :controller => "users", :action => "index"
    else
      render :action => "edit"
    end
  end
###############################
#####			CHOOSE USER			#####
	def chooseUser
		@users = User.all
	end
###############################
end
