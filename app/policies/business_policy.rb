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
    @user.has_role?:superAdmin or  @user.has_role?:admin 
  end
  def show?
    @user.has_role?:superAdmin or  @user.has_role?:admin 
  end
  def edit?
   @record.user.id == @user.id or  @user.has_role?:superAdmin 
  end

  def update?
    edit?
  end

  def destroy?
    @record.user.id == @user.id or @user.has_role?:superAdmin 
  end



end
