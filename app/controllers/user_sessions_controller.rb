class UserSessionsController < ApplicationController
	protect_from_forgery
	skip_before_filter :require_login, :except => [:destroy]

	def new
		@user = User.new
	end

	def create
    if @user = login(params[:username],params[:password])
      redirect_to(:root, :notice => 'Login successful!')
    else
      redirect_to(:login, :alert => 'Login failed!')
    end
  end

  def destroy
    logout
    redirect_to(:login, :notice => 'Logged out!')
  end
end
