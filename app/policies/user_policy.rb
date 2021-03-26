class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end
  

  def edit?
    @user.has_role?:superAdmin
  end

  def update
    edit?
  end

  
end
