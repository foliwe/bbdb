class CategoryPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    true
  end
  def show?
    true
  end
  def create?
    @user.has_role?:superAdmin  or @user.has_role?:admin
  end
  def edit?
   @user.has_role?:superAdmin  or @user.has_role?:admin
  end

  def update?
    edit?
  end

  def destroy?
    @user.has_role?:superAdmin  or @user.has_role?:admin
  end

end
