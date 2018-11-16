class UsersController < ApplicationController
  before_action :require_login, only: [:show]

  def show
    @user = User.find_by(id: params[:id])
    render :show
  end

  def new
    render :new
  end

  def create
    user = User.new(user_params)
    
    if user.save
      login!(user)
      redirect_to user_url(user)
    else
      flash.now[:errors] = user.errors.full_messages
      render :new
    end
  end

  def user_params
    params.require(:user).permit(:email, :password)
  end

  def require_login
    redirect_to new_user_url unless logged_in?
  end
end
