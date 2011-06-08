class Assignment < ActiveRecord::Base
  belongs_to :project
  belongs_to :user

  attr_accessible :project_id, :user_id, :role, :status

  STATUS = ["pendiente", "completado"]
  ASSIGNMENTS = ["costos","tecnologia","desarrollo","legal","riesgos","oportunidades"]
 
  scope :by_project, lambda{|q| where(:project_id => q)}
  scope :pending, lambda{where(:status => STATUS[0])}

  def self.assignment_list
    ASSIGNMENTS
  end

  def init_status
    self.status = STATUS[0]
  end
end
