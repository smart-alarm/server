class UsersController < ApplicationController

	#skip_before_action :verify_authenticity_token
	before_action :confirm_logged_in, :except => [:login, :authenticate, :logout]

	def login
		#render login.html.erb
	end

	def logout
    session[:user_id] = nil
    flash[:notice] = "Logged out successfully."
    redirect_to(:action => 'login')
	end

	def authenticate
		if params[:email].present? && params[:password].present?
			user = User.where(:email => params[:email]).first
			if user
				authorized_user = user.authenticate(params[:password])
				if authorized_user
					#flash[:notice] = "Login successful!"
					#redirect_to(:root)
					respond_to do |format|
						format.html {
							session[:user_id] = authorized_user.id
							redirect_to(:controller => 'user_history_records', :action => 'index')
						}
        		format.json {
							response = Hash.new
							response['status'] = "Login successful!"
							response['user'] = authorized_user
							render json: response
						}
					end
				else
					#flash[:notice] = "Invalid email/password."
					#redirect_to(:root)
					response = Hash.new
					response['status'] = "Invalid email/password"
					render json: response
				end
			end
		else
			#flash[:notice] = "Invalid email/password."
			#redirect_to(:root)
			response = Hash.new
			response['status'] = "Invalid request"
			render json: response
		end
	end

	private
	def user_params
		params.require(:user).permit(:email, :password, :password_confirmation)
	end

end
