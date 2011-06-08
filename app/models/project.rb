class Project < ActiveRecord::Base
  has_many :assignments

  has_attached_file :rfp
  attr_accessible :name, :status, :score, :rfp

  STATUS = ["pendiente", "aprovado", "rechazado"]

  def self.status_list
    STATUS
  end

  def grades_pending
    Assignment.pending.by_project(id).count > 0
  end

  def pending_users
    user_ids = []
    Assignment.pending.by_project(id).each do |a|
      user_ids << a.user_id
    end
    user_ids.uniq!
    users = []
    user_ids.each do |id|
      users << User.find(id)
    end
    users
  end
end
