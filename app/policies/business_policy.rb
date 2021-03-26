class BusinessPolicy < ApplicationPolicy

  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def edit?
   @record.user.id == @user.id or  @user.has_role?:superAdmin 

  def update?
    edit?
  end

  def destroy?
    @record.user.id == @user.id or @user.has_role?:superAdmin
  end
end
