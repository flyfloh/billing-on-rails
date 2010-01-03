class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new params[:user]
    @user.company = Company.new
    if @user.save
      flash[:notice] = "User has been created"
      redirect_to root_path
    else
      render :action => "new"
    end
  end
end
