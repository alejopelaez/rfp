class RiskScore < ActiveRecord::Base
  belongs_to :user
  belongs_to :project

  attr_protected

  scope :by_project, lambda{|q| where(:project_id => q)}

  def avg
    (penalties+fulfillment_probability)/2.0
  end
end
