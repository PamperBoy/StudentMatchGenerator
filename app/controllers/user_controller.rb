class UserController < ApplicationController

  def show
    @user = current_user
    @groups = StudentGroup.all


    if @user.admin == false
      @current_user_groups = @groups.where(user_id: @user.id).all
    end
  end

  private

  def get_student_group(id)
    @groups.where(group_id: id).where.not('date >= ?', Date.today).all
  end


  def get_group_history(id)
    @groups.where(group_id: id).where.not('date >= ?', Date.today).all
  end


  def get_group_today(id)
    @groups.where(group_id: id, date: Date.today).all
  end

  helper_method :get_student_group, :get_group_today, :get_group_history

end
