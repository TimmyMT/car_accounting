# frozen_string_literal: true

class CarsPolicy < ApplicationPolicy
  def index?
    admin?
  end

  def create?
    admin? || user.manager?
  end

  def manager_cars?
    admin?
  end
end
