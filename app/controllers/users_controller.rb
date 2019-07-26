class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @usercomments = Comment.all.page params[:message].per(4)
  end
end
