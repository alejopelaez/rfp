class Project < ActiveRecord::Base
  has_attached_file :rfp
  attr_accessible :name, :status, :score, :rfp

  STATUS = ["pendiente", "aprovado", "rechazado"]

  def self.status_list
    STATUS
  end
end
