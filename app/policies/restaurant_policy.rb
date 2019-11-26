class RestaurantPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  # not necessary because we have class inheritance
  # def new?
  #   create?
  # end

  def create?
    true
  end

  def show?
    true
  end

  # def edit?
  #   update?
  # end

  def update?
    # if @restaurant.user == current_user
    # if record.user == user
    #   return true
    # else
    #   return false
    # end

    # record.user == user ? true : false
    is_owner_or_admin?
  end

  def destroy?
    is_owner_or_admin?
  end

  private

  def is_owner_or_admin?
    record.user == user || user.admin
  end
end
