# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.has_role? :admin
      can :manage, :all
    elsif user.has_role? :taker
      can :read, :all
      can :create, Answer
      can :update, Answer
      cannot :delete, Answer
    else
      can :read, :all
    end
  end
end
