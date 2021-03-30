class BusinessPolicy < ApplicationPolicy

  class Scope < Scope
    def resolve
      scope.all
    end

    # def resolve_admin
    #   @user.has_role?:superAdmin  or @user.has_role?:admin 
    # end
  end

  def index?
    true
  end
  def show?
    true
  end
  def edit?
   @record.user.id == @user.id or  @user.has_role?:superAdmin or  @user.has_role?:admin 
  end

  def update?
    edit?
  end

  def destroy?
    @record.user.id == @user.id or @user.has_role?:superAdmin or @user.has_role?:admin
  end



end
