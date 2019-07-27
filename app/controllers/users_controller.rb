class UsersController < ApplicationController
    before_action :user_authorization

 
  def show
    @user = User.find(params[:id])
    @usercomments = @user.comments.page(params[:page]).per(4)
  end

   private

     def user_authorization
        redirect_to(root_url) unless current_user.id.to_s == params[:id]
     end
end
