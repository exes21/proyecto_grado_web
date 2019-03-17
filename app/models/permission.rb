class Permission < ApplicationRecord
  include CanCan::Ability

  def initialize(user)
    if user.admin?
      can :manage, :users
    end

    # user.role.permissions.each do |permission|
    #   if permission.subject_class == "all"
    #     can permission.action.to_sym, permission.subject_class.to_sym
    #   else
    #     can permission.action.to_sym, permission.subject_class.constantize
    #   end
    # end
  end
end
