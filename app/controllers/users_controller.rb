#
class UsersController < ApplicationController
  # BEGIN: before_action section
  before_action :may_show_user, only: [:show]
  # END: before_action section

  # BEGIN: ACTION SECTION
  def show
    @user = User.find(params[:id])
  end
  # END: ACTION SECTION

  private

  # BEGIN: private section
  def correct_user
    current_user == User.find(params[:id])
  end

  def admin_or_correct_user
    correct_user || admin_signed_in?
  end
  helper_method :admin_or_correct_user

  def may_show_user
    return redirect_to(root_path) unless admin_or_correct_user
  end
  helper_method :may_show_user
  # END: private section
end
