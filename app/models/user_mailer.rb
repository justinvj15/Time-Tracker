class UserMailer < ActionMailer::Base
def notifytask(task)
  recipients task.user.email
  from "Project Manager"
  subject "New task assigned to you"
  body :task=>task
end
def invite(invitation)
  recipients invitation.email
  from "Project Manager time tracking application"
  subject "You are invited to time tracking application"
  body :invitation=>invitation
end
end
