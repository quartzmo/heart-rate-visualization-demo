class UsersController < ApplicationController
  def index
    @users = User.order(:id).limit(10)
  end

  def show
    @user = User.find(params[:id])
  end
end
