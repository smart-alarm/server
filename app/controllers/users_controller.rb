class UsersController < ApplicationController

	#skip_before_action :verify_authenticity_token
	before_action :confirm_logged_in, :except => [:login, :authenticate, :logout]

	def login
		#render login.html.erb
	end

	def all
		@users = User.all
	end

	def new
		#render new.html.erb
	end

	def create
		@user = User.new(user_params)
		if @user.save
			flash[:notice] = "User created!"
			redirect_to(:controller => 'users', :action => 'all')
		else
			render('new')
		end
	end

	def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(session[:user_id])
    if @user.email == params[:user][:email]
	    if @user.authenticate(params[:old_password])
		    if @user.update_attributes(user_params)
		      flash[:notice] = "Account updated!"
		      redirect_to(:action => 'all')
		    else
		      render('edit')
		    end
		  else
		  	render('edit')
		  end
		else
			flash[:notice] = "You do not have permission to perform this action"
			redirect_to(:action => 'all')
		end
  end

	def destroy
		if session[:user_id] == 1 or session[:user_id] == 2
			unless params[:id] == 1 or params[:id] == 2
	    	User.find(params[:id]).destroy
	    	flash[:notice] = "Admin deleted!"
	    	redirect_to(:action => 'all')
			else
				redirect_to(:action => 'all')
	    end
	  else
	  	flash[:notice] = "You do not have permission to perform this action"
	  	redirect_to(:action => 'all')
  	end
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
					respond_to do |format|
						format.html {
							flash[:notice] = "Invalid email/password."
							redirect_to(:action => 'login')
						}
						format.json {
							response = Hash.new
							response['status'] = "Invalid email/password"
							render json: response
						}
					end
				end
			end
		else
			respond_to do |format|
				format.html {
					flash[:notice] = "Invalid request."
					redirect_to(:action => 'login')
				}
				format.json {
					response = Hash.new
					response['status'] = "Invalid request."
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
