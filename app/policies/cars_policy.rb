class CarsPolicy < ApplicationPolicy
  def index?
    admin?
  end

  def create?
    admin? || user.manager?
  end
end
