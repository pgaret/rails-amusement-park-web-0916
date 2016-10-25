class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(name: params[:user][:name])
    if @user.password == params[:user][:password]
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash[:notice] = "Incorrect password"
      redirect_to root_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
