class Task < ActiveRecord::Base
  validates_presence_of :name
  #validates_presence_of :project_id
  #validates_presence_of :user_id
  belongs_to:project
  belongs_to:user
  
end
