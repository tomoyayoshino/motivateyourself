class TasksController < ApplicationController
  before_action :authenticate_user!

  def new
    @task = Task.new
  end

  def create
    @task = current_user.tasks.new task_params
    @task.save!
    redirect_to root_path
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = target_task params[:id]
    @task.update(task_params)
    redirect_to root_path
  end

  def destroy
    @task = target_task params[:id]
    @task.destroy
    redirect_to root_path
  end

  private

  def target_task task_id
    current_user.tasks.where(id: task_id).take
  end

  def task_params
    params.require(:task).permit(:title, :description)
  end
end
