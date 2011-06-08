class Assignment < ActiveRecord::Base
  belongs_to :project
  belongs_to :user

  attr_accessible :project_id, :user_id, :role, :status

  STATUS = ["pendiente", "completado"]
  ASSIGNMENTS = ["costos","tecnologia","desarrollo","legal","riesgos","oportunidades"]
 
  scope :by_project, lambda{|q| where(:project_id => q)}
  scope :by_user, lambda{|q| where(:user_id => q)}
  scope :by_role, lambda{|q| where(:role => q)}
  scope :sort_by_project, lambda{order(:project_id)}
  scope :pending, lambda{where(:status => STATUS[0])}

  def self.assignment_list
    ASSIGNMENTS
  end

  def init_status
    self.status = STATUS[0]
  end

  def complete
    self.status = STATUS[1]
    self.save
  end
end
