class RelationshipsController < ApplicationController
  before_action :set_user, only: [:create, :destroy]
  def index
    user = current_user
    @follow_users = user.followings
  end

  def show
    user = current_user
    @follower_users = user.followers
  end

  def create
    user = User.find(params[:follow_id])
    following = current_user.follow(user)
    if following.save
      # flash[:success] = 'ユーザーをフォローしました'
      redirect_back(fallback_location: root_path)
    else
      # flash.now[:alert] = 'ユーザーのフォローに失敗しました'
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    user = User.find(params[:follow_id])
    following = current_user.unfollow(user)
    if following.destroy
      # flash[:success] = 'ユーザーのフォローを解除しました'
      redirect_back(fallback_location: root_path)
    else
      # flash.now[:alert] = 'ユーザーのフォロー解除に失敗しました'
      redirect_back(fallback_location: root_path)
    end
  end

  private

  def set_user
    user = User.find(params[:follow_id])
  end

end