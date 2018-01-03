class UserController < ApplicationController

  def show
    @user = current_user

    if @user.admin
      @current_user_groups = StudentGroup.all
    else
      @current_user_groups = StudentGroup.where(user_id: @user.id).all
    end
  end
end
