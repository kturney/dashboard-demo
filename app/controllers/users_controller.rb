class UsersController < ApplicationController
  include SessionsHelper

  def show
    @user = User.find(params[:id])

    if @user == current_user # let the user perform actions
      if @user.group.teacher?
        show_teacher
      elsif @user.group.student?
        show_student
      else
        # TODO: handle unknown group
      end
    else # just show general user info
      show_info
    end
  end

  private
    def show_teacher
      @courses = Course.where('teacher_id = ?', @user.id)

      render 'teacher'
    end

    def show_student
      render 'student'
    end

    def show_info
      render 'show'
    end
end
