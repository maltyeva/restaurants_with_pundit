class RestaurantPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  # def new?
  #   create?
  # end

  def create?
    true
  end

  def show?
    true
    # record.exists?
  end


  def update?
    # edit a restaurant if i created it
    # if @restaurant.user == current_user
    # true
    # else
    #   false
    # end

    # record.user == user ? true : false

    user_is_owner_or_admin?

  end

  def destroy?
    user_is_owner_or_admin?
  end

  def user_is_owner_or_admin?
    record.user == user || user.admin
  end

end
