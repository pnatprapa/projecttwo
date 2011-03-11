class PagesController < ApplicationController
#####			LOGIN			#####  
  def login
  	#If wrong set both password and username to blank
  	if params[:user] == nil
      username = password = ""
    #Enter the username and password
    else
      username = params[:user][:username]
      password = params[:user][:password]
    end
    conn = ActiveRecord::Base.connection
    user_id = conn.select_value("select get_id('" + username + "','" + password + "')").to_i
    #For guest username, redirect to main page
    if username == password && username == "guest"
      #Cookies
      cookies.signed[:user_id] = -1
      cookies.signed[:authenticated] = false
      cookies.signed[:is_admin] = false
      redirect_to :controller => "user_suggestions", :action => "index"
    elsif user_id > 0
      #If user authenticate is good
      cookies.signed[:user_id] = user_id
      cookies.signed[:authenticated] = true
      user = User.find(cookies.signed[:user_id])
    division = user['div']
    department = user['dep']
    	#determination if user is superuser or regular user by cookie
      if department == division
        cookies.signed[:is_admin] = true
      elsif
        cookies.signed[:is_admin] = false
      end
      #redirect users to continue page, intermidiary page to editting pages
      redirect_to :controller => "pages", :action => "continue"
    end
  end
#########################
#####			LOGOUT			#####
  def logout
  end
###########################

end
