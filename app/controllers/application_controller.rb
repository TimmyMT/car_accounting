# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pundit::Authorization

  rescue_from Pundit::NotAuthorizedError, with: :friendly_redirect

  before_action :authenticate_user!

  private

  def friendly_redirect
    flash[:alert] = 'Access denied'
    redirect_to root_path
  end
end
