class TshirtPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def create?
    true
  end

  def new?
    true
  end

  def edit?
    user.admin || user == record.user
  end

  def update?
    user.admin || user == record.user
  end

  def destroy?
    user.admin || user == record.user
  end
end
