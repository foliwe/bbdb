class CategoryPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    @user.has_role?:superAdmin  or @user.has_role?:admin
  end
  def show?
    index?
  end
  def create?
    index?
  end
  def edit?
    index?
  end

  def update?
    index?
  end

  def destroy?
    index?
  end

end
