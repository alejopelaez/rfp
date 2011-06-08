class User < ActiveRecord::Base
  attr_accessible :username, :email, :password, :password_confirmation

  acts_as_authentic do |c|
  end

  def assignment_done? project_id, role
    Assignment.pending.by_user(id).by_project(project_id).by_role(role).count == 0
  end

  def pending_assignments
    Assignment.pending.by_user(id).sort_by_project
  end
end
