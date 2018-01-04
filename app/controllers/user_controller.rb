class UserController < ApplicationController

  def show
    @user = current_user
    @groups = StudentGroup.all


    if @user.admin == false
      @groups = @groups.where(user_id: @user.id).all
    end
  end

  private


  def method_name

    @current_user_groups = @groups.where(user_id: @user.id).all
    @current_user_groups.each do | group |

    end
  end



  def get_student_group(id)
    StudentGroup.all.where(group_id: id).all
  end


  def get_group_history(id)
    StudentGroup.all.where(group_id: id).where.not('date >= ?', Date.today).all
  end


  def get_group_today(id)
    StudentGroup.all.where(group_id: id, date: Date.today).all
  end

  helper_method :get_student_group, :get_group_today, :get_group_history

end
