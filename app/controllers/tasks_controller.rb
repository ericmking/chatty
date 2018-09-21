class TasksController < ApplicationController
  def index
    @tasks = @band.tasks.all.order(:position)
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.band = @band

    if @task.save
      redirect_to tasks_path
    else
      render 'new'
    end
  end

  private

  def task_params
    params.require(:task).permit(:name, :description, :due_date, :responsible_user_id)
  end
end