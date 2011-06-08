class Assignment < ActiveRecord::Base
  belongs_to :project
  belongs_to :user

  attr_accessible :project_id, :user_id, :role

  STATUS = ["pendiente", "completado"]
  ASSIGNMENTS = ["costos","tecnologia","desarrollo","legal","riesgos","oportunidades"]
  
  def self.assignment_list
    ASSIGNMENTS
  end
end
