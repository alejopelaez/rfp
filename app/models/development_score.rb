class DevelopmentScore < ActiveRecord::Base
  belongs_to :user
  belongs_to :project

  attr_protected

  def avg
    (scope+activities+deadline+knowledge+technology_availability+human_availability+experience)/7.0
  end
end
