class UsersController < ApplicationController
  # def index
  #   @users = User.all
  # end

  def show
    @user = User.find(params[:id])
  end

  def new
  end

  def create
    # binding.pry
    @user = User.new(user_params(:name, :password, :nausea, :happiness, :tickets, :height, :admin))
    @user.save
    binding.pry
    redirect_to user_path(@user)
  end

  def edit
  end

  def update
  end

  # def destroy
  # end

  private

  def user_params(*args)
    params.require(:user).permit(args)
  end
end
