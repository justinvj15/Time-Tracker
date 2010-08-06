class TasksController < ApplicationController
  before_filter :login_required 
  def index
    @tasks= @current_user.tasks
  end

  def new
   @task=Task.new
     #@task.project_id=params[:id]
  end
  
  def edit
    @task=Task.find(params[:id])
  end

  def create
     @task=Task.new(params[:task])
   #@task.project_id=params[:id]
    if @task.save
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
end
