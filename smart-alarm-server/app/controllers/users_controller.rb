class UsersController < ApplicationController

	#skip_before_action :verify_authenticity_token

	def login
		#render login.html.erb
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			respond_to do |format|
				format.html {
					flash[:notice] = "User created! The user_id is #{@user.id}"
					redirect_to(:root)
				}
				format.json {
					response = Hash.new
					response['status'] = 'User created!'
					response['user'] = @user
					render json: response
				}
			end
		else
			respond_to do |format|
				format.html {
					render('new')
				}
				format.json {
					response = Hash.new
					response['status'] = 'Error creating user.'
					render json: response
				}
			end
		end
	end

	def authenticate
		if params[:email].present? && params[:password].present?
			user = User.where(:email => params[:email]).first
			if user
				authorized_user = user.authenticate(params[:password])
				if authorized_user
						response = Hash.new
						response['status'] = "Login successful!"
						response['user'] = authorized_user
						render json: response
				else
					respond_to do |format|
						format.html {
							flash[:notice] = "Invalid email/password."
							redirect_to(:root)
						}
						format.json {
							response = Hash.new
							response['status'] = 'Invalid email/password'
							render json: response
						}
					end
				end
			end
		else
			respond_to do |format|
				format.html {
					flash[:notice] = "Improper request"
					redirect_to(:root)
				}
				format.json {
					response = Hash.new
					response['status'] = 'Improper request.'
					render json: response
				}
			end
		end
	end

	private
	def user_params
		params.require(:user).permit(:email, :password, :password_confirmation)
	end

end
