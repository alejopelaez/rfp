class LegalScore < ActiveRecord::Base
belongs_to :user
  belongs_to :project

  attr_protected

  def avg
    (requirements+restrictions+contract)/3.0
  end
end
