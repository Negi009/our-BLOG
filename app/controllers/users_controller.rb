class UsersController < ApplicationController

  before_action :find_user, only: [:show, :edit, :update, :destroy]
  def index
    @users = User.all
  end

  def show 

  end

  def new
    @user = User.new
  end

  def create
    @user = User.new
    if @user.save
      flash[:notice] = "User Successfully Created"
      redirect_to @user
    else
      render 'new'
    end
  end 

  def edit

  end

  def update
    if @user.update(user_params)
      flash[:notice] = "User updated successfully"
      redirect_to users_path
    else
      render 'edit'
    end
  end

  def destroy
    @user.destroy
    flash[:notice] = "User deleted successfully from our blog"
    redirect_to root_path
  end

  private

  def user_params
    permit.require(:user).permit(:username, :email, :password)
  end

  def find_user
    @user = User.find(params[:id])
  end
end