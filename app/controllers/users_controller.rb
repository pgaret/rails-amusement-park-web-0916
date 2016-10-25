class UsersController < ApplicationController
  # def index
  #   @users = User.all
  # end

  def new
  end

  def create
    # binding.pry
    @user = User.new(user_params(:name, :password, :nausea, :happiness, :tickets, :height, :admin))
    @user.save
    login(@user)
    redirect_to user_path(@user)
  end

  def edit
  end

  def update
  end

  # def destroy
  # end

  def home
  end

  def show
    if logged_in?
      @user = User.find(params[:id])
    else
      redirect_to root_path
    end
  end

  private

  def user_params(*args)
    params.require(:user).permit(args)
  end

end
