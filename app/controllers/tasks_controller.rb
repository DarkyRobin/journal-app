class TasksController < ApplicationController
  before_action :authenticate_user! 

  def show
    @task = Task.find(params[:id])
    respond_to do |format|
      format.html
      format.js
    end
  end

  def index
    @tasks = current_user.tasks
  end

  def new
    @task = current_user.tasks.build
  end

  def create
    @task = current_user.tasks.build(task_params)

    if @task.save
      redirect_to dashboard_path, success: 'Task was successfully created.'
    else
      render :new
    end
  end

  def edit
    @task = current_user.tasks.find(params[:id])
  end

  def update
    @task = current_user.tasks.find(params[:id])

    if @task.update(task_params)
      redirect_to tasks_path, success: 'Task was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @task = current_user.tasks.find(params[:id])
    @task.destroy

    redirect_to dashboard_path, success: 'Task was successfully deleted.'
  end

  private

  def task_params
    params.require(:task).permit(:title, :description, :due_date, :category_id)
  end
end
