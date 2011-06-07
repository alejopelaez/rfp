class User < ActiveRecord::Base
  attr_accessible :username, :email, :password

  acts_as_authentic do |c|
    c.validate_password_field = false
    c.validate_email_field = false
  end
end
