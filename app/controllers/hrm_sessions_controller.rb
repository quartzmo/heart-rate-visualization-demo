class HrmSessionsController < ApplicationController

  before_action :set_user

  def index
    @hrm_sessions = @user.hrm_sessions
  end

  def show
    @hrm_session = @user.hrm_sessions.find(params[:id])
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

end
