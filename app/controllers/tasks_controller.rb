class TasksController < ApplicationController

  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    task = Task.new(set_task_params)
    task.save
    redirect_to all_tasks_path
  end

  def edit
    @task =  Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(set_task_params)
    redirect_to all_tasks_path()
  end

  private

  def set_task_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
