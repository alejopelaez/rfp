class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    unless user.nil?
      can :read, :all
      can :update, :all
      can :destroy, :all

      can :manage, User

      assignments = Assignment.assignment_list

      # Define when a user can grade part of a RFP
      # This is done by checkng the DB if there exist a record
      # Relating the user and the project with that particular role
      can :grade_cost, Project do |p|
        assignment = Assignment.where(:user_id => user.id, :project_id => p.id, :role => assignments[0])
        !assignment.nil?
      end

      can :grade_technology, Project do |p|
        assignment = Assignment.where(:user_id => user.id, :project_id => p.id, :role => assignments[1])
        !assignment.nil?
      end

      can :grade_development, Project do |p|
        assignment = Assignment.where(:user_id => user.id, :project_id => p.id, :role => assignments[2])
        !assignment.nil?
      end

      can :grade_legal, Project do |p|
        assignment = Assignment.where(:user_id => user.id, :project_id => p.id, :role => assignments[3])
        !assignment.nil?
      end

      can :grade_risks, Project do |p|
        assignment = Assignment.where(:user_id => user.id, :project_id => p.id, :role => assignments[4])
        !assignment.nil?
      end

      can :grade_opportunities, Project do |p|
        assignment = Assignment.where(:user_id => user.id, :project_id => p.id, :role => assignments[5])
        !assignment.nil?
      end
    end
    #
    # The first argument to `can` is the action you are giving the user permission to do.
    # If you pass :manage it will apply to every action. Other common actions here are
    # :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. If you pass
    # :all it will apply to every resource. Otherwise pass a Ruby class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details: https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end
