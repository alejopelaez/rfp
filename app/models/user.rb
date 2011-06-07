class User < ActiveRecord::Base
  attr_accessible :username, :email, :password
  act_as_authentic
end
