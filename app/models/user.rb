class User < ActiveRecord::Base
  acts_as_authentic do |c|
  end # block optional

	has_many	:user_roles, :class_name => "UserRole"
	has_many	:roles, :through => :user_roles, :class_name => "Role"
end
