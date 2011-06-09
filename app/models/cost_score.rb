class CostScore < ActiveRecord::Base
  belongs_to :user
  belongs_to :project

  attr_protected

  scope :by_project, lambda{|q| where(:project_id => q)}

  def avg
    (cost+payment+payment_option)/3.0
  end
end
