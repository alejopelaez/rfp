class OpportunityScore < ActiveRecord::Base
  belongs_to :user
  belongs_to :project

  attr_protected

  scope :by_project, lambda{|q| where(:project_id => q)}

  def avg
    (adquired_knowledge+importance+positioning)/3.0
  end
end
