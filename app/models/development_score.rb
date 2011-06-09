class DevelopmentScore < ActiveRecord::Base
  belongs_to :user
  belongs_to :project

  attr_protected

  scope :by_project, lambda{|q| where(:project_id => q)}

  def avg
    (scope+activities+deadline+knowledge+technology_availability+human_availability+experience)/7.0
  end
end
