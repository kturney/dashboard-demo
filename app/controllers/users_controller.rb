class UsersController < ApplicationController
  include SessionsHelper

  def show
    @user = User.find(params[:id])

    if @user == current_user # let the user perform actions
      if @user.group.teacher?
        render 'teacher'
      elsif @user.group.student?
        render 'student'
      else
        # TODO: handle unknown group
      end
    else # just show general user info
      render 'show'
    end
  end

end
