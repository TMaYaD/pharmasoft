class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, ActiveAdmin::Page, name: 'Dashboard'
    send user.role
  end

  def admin
    can :manage, :all
  end

  def store_manager
  end

  def production_manager
  end

  def quality_analyst
  end

  def purchase_manager
  end

  def sales_manager
  end

  def guest
  end
end
