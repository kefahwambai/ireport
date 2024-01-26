class Ability
  include CanCan::Ability

  def initialize(user)
    if user.nil?
      can :create, User
    elsif user.admin?
      can :manage, :all
    else
      can :read, [Redflag, Intervention, GovernmentAgency]
      can :read, User, redflags: { id: user.id } 
      can :read, User, interventions: { id: user.id } 
      can :create, [Redflag, Intervention]
      can :update, [Redflag, Intervention], user_id: user.id
      can :destroy, [Redflag, Intervention], user_id: user.id
    end
  end
end
