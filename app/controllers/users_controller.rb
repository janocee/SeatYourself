class UsersController < ApplicationController

	def new
		@user = User.new
	end

	def create
		@user = User.new(reso_params)

		if @user.save
			redirect_to restaurants_url, :notice => "Signed up!"
		else
			render "new"
		end
	end

	def show

	end

	private
	def reso_params
		params.require(:user).permit(:email, :password, :password_confirmation, :name)
	end


end
