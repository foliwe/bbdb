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
    @user.has_role?:superAdmin 
  end

  def create?
    @user.has_role?:superAdmin or  @user.has_role?:admin 
  end

  def show?
    @user.has_role?:superAdmin or  @user.has_role?:admin 
  end

  def edit?
    @user.has_role?:superAdmin
  end

  def update?
    edit?
  end

  def destroy?
    edit?
  end
  
end
