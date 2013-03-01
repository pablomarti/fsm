class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new #Guest user

    if user.role? :admin
      can :manage, :all 
    else
      if user.role? :read_case
        can :read, SystemCase
      end 

      if user.role? :create_case
        can :read, SystemCase
        can :create, SystemCase
      end

      if user.role? :update_case
        can :read, HumanRecord

        if user.role? :demand
          can :manage_demand, HumanRecord
        end
      end
    end

=begin    
    if user.role? :admin
      can :manage, :all   	
    else
      can :read, :all
      #can :create, Comment
      #can :update, Comment do |comment|
      #  comment.try(:user) == user || user.role?(:moderator)
      #end
      if user.role? :writer
      	can :manage, PostContent
        can :create, Post
        can [:update, :destroy], Post do |post|
          post.try(:user) == user
        end
      elsif user.role? :moderator
      	can :manage, PostContent
      	can :manage, Post
      end
    end
=end
  end

end