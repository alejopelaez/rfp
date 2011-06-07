class Assignment < ActiveRecord::Base
  belongs_to :project
  belongs_to :user

  attr_accessible :project_id, :user_id, :role

  ASSIGNMENTS = ["costs","technology","legal"]
  
  def self.assignment_list
    ASSIGNMENTS
  end
end
