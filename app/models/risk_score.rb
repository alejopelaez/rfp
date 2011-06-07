class RiskScore < ActiveRecord::Base
  belongs_to :user
  belongs_to :project

  attr_protected

  def avg
    (penalties+fulfillment_probability)/2.0
  end
end
