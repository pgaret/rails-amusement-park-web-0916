class SessionsController < ApplicationController

  def show
  end

  def new
  end

  def create
    @user = User.find_or_create_by(name: params[:name])
    if @user.password == params[:password]
      redirect_to user_path(@user)
    else
      flash[:notice] = "Incorrect password"
      redirect_to new_session_path
    end
  end

  def destroy
    redirect_to new_session_path
  end
end
