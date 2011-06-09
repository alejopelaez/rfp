class LegalScore < ActiveRecord::Base
belongs_to :user
  belongs_to :project

  attr_protected

  scope :by_project, lambda{|q| where(:project_id => q)}

  def avg
    (requirements+restrictions+contract)/3.0
  end
end
