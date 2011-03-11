class UsersController < ApplicationController
#####			NEW			#####
  def new
  end
#######################
#####			EDIT			#####
  def edit
    @user = User.find(params[:id])
  end
#########################
#####			INDEX			#####
  def index
    @users = User.all
  end
#########################
#####			CHOOSE USER			#####
  def chooseUser
    @users = User.all
  end
###############################
#####			CREATE			#####
  def create
  	# specify tags
    first_name = params[:user][:first_name]
    last_name = params[:user][:last_name]
    email = params[:user][:email]
    username = params[:user][:username]
    password = params[:user][:password]
    department = params[:user][:dep]
    division = params[:user][:div]
    # connect to DB
    conn = ActiveRecord::Base.connection
    # sql insert
    sql = "insert into users_view (first_name,last_name,email,username,password,dep,div) " +
    "values ('" + first_name + "','" + last_name + "','" + email + "',
    '" + username + "', '" + password + "','" + department + "','" + division + "')"
    conn.insert(sql)
    # redirect
    redirect_to :controller => "users", :action => "index"
  end
###########################
#####			UPDATE			#####
  def update
  	#update this user id
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
###########################
  
end
