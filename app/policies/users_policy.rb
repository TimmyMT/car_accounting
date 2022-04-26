# frozen_string_literal: true

class UsersPolicy < ApplicationPolicy
  def index?
    admin?
  end

  def show?
    admin?
  end
end
