class RuteadorController < ApplicationController
	layout 'devise'

  def index
  	if user_signed_in?
  		redirect_to home_path
  	end
  	# if admin_signed_in?
  	# 	redirect_to brokers_path
  	# end
  end
end
