class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @booknew = Book.new
    @user = User.all
    @users = current_user
  end

  def show
    @users = User.find(params[:id])
    @books = @users.books
    @booknew = Book.new
    @userself = current_user
  end

  def edit
  	@user = current_user
  end

  def update
  	@user = User.find(params[:id])
  	@user.update(user_params)
  	redirect_to @user, notice: "successfully !"
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end

