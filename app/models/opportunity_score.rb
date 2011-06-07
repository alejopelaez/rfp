class OpportunityScore < ActiveRecord::Base
  belongs_to :user
  belongs_to :project

  attr_protected

  def avg
    (adquired_knowledge+importance+positioning)/3.0
  end
end
