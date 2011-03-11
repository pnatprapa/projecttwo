class UserSuggestionsController < ApplicationController
#####			INDEX			#####
  def index
  	#For guest user
    if cookies.signed[:user_id] == -1
      @division = "all"
      @department = "all"
      @username = "Guest"
      @usersuggestions = UserSuggestion.all
    else 
    #For everyone else with authentication
      user = User.find(cookies.signed[:user_id])
      division = user['div']
      department = user['dep']
      @division = division
      @department = department
      @username = user['username']
      if department == division
        @usersuggestions = UserSuggestion.find_all_by_div(division)
      else
        @usersuggestions = UserSuggestion.find_all_by_dep(department)
      end
    end  
  end
#########################
#####			NEW			#####
	def new
	end
#######################
#####			CREATE			#####
	def create
		#Setting params
		text = params[:user_suggestion][:suggestion]
		#Cookie
    uid = cookies.signed[:user_id]
    #DB conn
    conn = ActiveRecord::Base.connection
    #DB insert to suggestions
    sql1 = "insert into suggestions(text,created_at,updated_at) values ('" + text + "',now(),now())"
    conn.insert(sql1)
    #DB put in sequence
    sql2 = "select currval('suggestion_id_seq')"
    sid = conn.select_value(sql2)
    #DB insert to user_suggestion
    sql3 = "insert into user_suggestion(user_id,suggestion_id) values (" + uid.to_s + "," + sid.to_s + ")"
    conn.insert(sql3)
    #Redirect user to index page
    redirect_to :controller => "user_suggestions", :action => "index"
	end
###########################
##### 			EDIT 			#####
	def edit
		#Edit suggestion
    @suggestion = Suggestion.find_by_id(params[:sugid])
  end
###########################
#####			CHOOSING SUGGESTION			#####
	def chooseSuggestion
		#Selection for user suggestion
    user = User.find(cookies.signed[:user_id])
    division = user['div']
    department = user['dep']
    if department == division
      @suggestions = UserSuggestion.find_all_by_div(division)
    else
      @suggestions = UserSuggestion.find_all_by_dep(department)
    end
  end
#######################################
#####			UPDATE			#####
	def update
		#update suggestion on this ID
    @suggestion = Suggestion.find_by_id(params[:suggestion][:id])
    if @suggestion.update_attributes(
    :text => params[:suggestion][:text],
    :updated_at => Time.now)
      redirect_to :controller => "user_suggestions", :action => "index"
    else
      render :action => "edit"
    end
  end
###########################
end
