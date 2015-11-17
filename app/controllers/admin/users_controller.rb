class Admin::UsersController < ApplicationController

	before_action :logged_in_user
  
  before_action :admin_user,     only: [:destroy ,:edit, :update]
  
  def index
    @users = User.paginate(page: params[:page])
    
  end
  def show 
    
  end
  def edit
    @user = User.find(params[:id])
  end

  def update
      @user = User.find(params[:id])
      if @user.update_attributes(user_params)
        flash[:success] = "Profile updated"
        redirect_to @user
      else
        flash[:fail] = "Profile updated failed"
        render 'edit'
    end
  end

  def destroy
      if User.find(params[:id]).destroy
        flash[:success] = "User deleted"
        redirect_to admin_users_url
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :email)
    end
    def logged_in_user
      unless logged_in?
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end