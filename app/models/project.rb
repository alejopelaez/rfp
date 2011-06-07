class Project < ActiveRecord::Base
  attr_accessible :name, :status, :score
end
