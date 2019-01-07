class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @lectures = Lecture.where(user_id: current_user.id)
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to action: :show
    end
  end

  def following
    @user = User.find(params[:id])
    @users = @user.followings
    render partial: './users/show_follow'
  end

  def followers
    @user = User.find(params[:id])
    @users = @user.followers
    render partial: './users/show_follower'
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :nickname, :age, :gender, :profile, :profile_image)
  end
end

