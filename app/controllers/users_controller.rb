class UsersController < ApplicationController
  def new
  end
  def create
    @user = User.new(params.require(:user).permit(:first_name, :last_name, :email))
    if @user.save
      flash[:notice] = ["Welcome, #{@user.first_name}"]
      redirect_to user_path(User.last)
    else
      #errors we need to code later
      if @user.first_name == ''
        flash[:notice] = ["First name can't be blank"]
      end
      if @user.last_name == ''
        flash[:notice] = ["Last name can't be blank"]
      end
      if @user.email == ''
        flash[:notice] = ["Email can't be blank"]
      end
      redirect_to new_user_path
    end
  end
  def show
  end
end