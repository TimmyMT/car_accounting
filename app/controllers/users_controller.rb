class UsersController < ApplicationController
  before_action :access_action

  def index
    @users = User.find_each
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def access_action
    authorize(nil, policy_class: UsersPolicy)
  end
end
