class UserController < ApplicationController

  def show
    @user = current_user
    @groups = StudentGroup.all


    if @user.admin == false
      @current_user_groups = @groups.where(user_id: @user.id).all
    end
  end

  def get_student_group(id)
    @groups.where(group_id: id).all
  end

  helper_method :get_student_group

end
