class UsersController < ApplicationController
	def new
		@user = User.new
	end
	def create
		@user = User.new(user_params)
		if @user.save
			log_in @user
			redirect_to @user
		else
			redirect_to sign_up_path
		end
	end

	def edit
		@user = User.find(current_user.id)
	end

	def update
		@user = User.find(current_user.id)
		if @user.update_attributes(user_params)
			redirect_to user_path
		else
			redirect_to edit_user_path(current_user.id)
		end
	end
	def show
		if params[:id] == 'show'
			@user = User.find(current_user.id)
		else
			@user = User.find(params[:id])
		end
		
	end
private

	def user_params
		params.require(:user).permit(:avatar,:name, :email, :password)
	end

end