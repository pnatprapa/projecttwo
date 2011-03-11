# app/models/user_suggestion.rb
#
# == Schema Information
#
# Table name: user_suggestion_view
#
#  uid        :integer
#  first_name :text
#  last_name  :text
#  email      :text
#  username   :text
#  dep        :text
#  div        :text
#  sugid      :integer
#  text       :text
#  created_at :datetime
#  updated_at :datetime
#


class UserSuggestion < ActiveRecord::Base
	# allows for customized name for view
  set_table_name "user_suggestion_view"
end
