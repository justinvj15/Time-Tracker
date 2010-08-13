class TasksController < ApplicationController
  before_filter :login_required 
  def index
    @projects= @current_user.projects
    #@tasks= @tasks.find(:all,:condition=>["project_id=?",'#{@project.id}'])
    #@member=
    #@users=@tasks.user.find(:all)

  end

  def new
   @task=current_user.tasks.new
     #@task.project_id=params[:id]
  end
  
  def edit
    @task=Task.find(params[:id])
  end

  def create
     @task=Task.new(params[:task])
     @task.user_id=params[:members][:user_id]     
    if @task.save
     puts params[:members][:member_id]
     puts @task.id
     #@member=Member.new
     #@member.user_id=params[:members][:user_id]
      #@member.task_id=@task.id
      #@member.save
      flash[:notice]="task saved"
    UserMailer.deliver_notifytask(@task)
    redirect_to tasks_path
    else
    flash[:error]="task not saved"
    render :action =>'new'
    end
  end

  def update
    @task=Task.find(params[:id])
    if @task.update_attributes(params[:task])
    flash[:notice]="Task updated"
    redirect_to tasks_path
    else
    flash[:error]="Task not updated"
    render :action=>'edit'
    end
  end

  def destroy
     @task=Task.find(params[:id])
      if @task.destroy
    flash[:notice]="Task deleted"
    redirect_to tasks_path
      else
    flash[:error]="Task not deleted"
    render :action=>'index'
      end
  end
  def save_time
puts params[:disp]
puts params[:id]
@task=Task.find(params[:id])
@old=@task.time
puts @old
@task.time=params[:disp]
if @task.save
  flash[:notice]="Time saved"
  redirect_to tasks_path
else
  flash[:error]="Time not saved"
  render:action=>show
end
  end

  def show
    @task=Task.find(params[:id])
  end
end
