class Client < ActiveRecord::Base
  validates_presence_of :name
  has_one:project,:dependent=>:destroy
  belongs_to:user
end
