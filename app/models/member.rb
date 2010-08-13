class Member < ActiveRecord::Base
  has_many:tasks
  belongs_to:user
end
