class RolePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end
  def index?
    @user.has_role?:superAdmin 
  end
  def show?
    @user.has_role?:superAdmin  or @user.has_role?:admin
  end
  def create?
    @user.has_role?:superAdmin 
  end
  def edit?
   @user.has_role?:superAdmin  
  end

  def update?
    edit?
  end

  def destroy?
    @user.has_role?:superAdmin 
  end
end
