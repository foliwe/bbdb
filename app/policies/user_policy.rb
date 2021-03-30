class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end

    def resolve_admin
      scope.all
    end
  end
   def dashboard?
    @user.has_role?:superAdmin or  @user.has_role?:admin 
   end
  def index?
    true
  end

  def create?
    @user.has_role?:superAdmin
  end

  def show?
    true
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
