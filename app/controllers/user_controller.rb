class UserController < ApplicationController

  def index
    @user = current_user
    if @user.admin
      @groups = StudentGroup.all
      @admins = User.where(admin: true).where.not(id: @user.id).all
      @students = User.where(admin: false).all
    else
      @groups = StudentGroup.where(user_id: @user.id).all
    end
  end

  def toggle_admin
    @user = User.find(params[:id])
    @user.toggle!(:admin)
    redirect_to root_path
  end

  private

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
