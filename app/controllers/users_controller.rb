class UsersController < ApplicationController

  before_action :require_user, only: [:edit, :update, :destroy]
  before_action :require_same_user, only: [:edit, :update, :destroy]
  before_action :find_user, only: [:show, :edit, :update, :destroy]
  
  def index
    @users = User.paginate(page: params[:page], per_page: 5)

  end

  def show 
    @articles = @user.articles.paginate(page: params[:page], per_page: 5)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "User Successfully Created"
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
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    current_user.destroy
    session[:user_id] = nil
    flash[:notice] = "User deleted successfully from our blog"
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :image)
  end

  def find_user
    @user = User.find(params[:id])
  end

  def require_same_user
    if current_user != current_user
      flash[:alert] = "You can only edit your own account"
      redirect_to articles_path
    end
  end
end
