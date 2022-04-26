# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :access_action

  def index
    @users = User.page(params[:page] || 1).per(params[:per] || 50)
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def access_action
    authorize(nil, policy_class: UsersPolicy)
  end
end
