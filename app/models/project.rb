class Project < ActiveRecord::Base
  validates_presence_of:client_id
  validates_presence_of:name

  has_many:tasks,:dependent=>:destroy
  belongs_to :client
  belongs_to :user
end
