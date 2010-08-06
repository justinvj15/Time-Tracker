class Client < ActiveRecord::Base
  has_one:project,:dependent=>:destroy
  belongs_to:user
end
