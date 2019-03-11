class TasksController < ApplicationController
  before_action :set_tasks, only: [:show]

  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
    @steps = @task.steps
  end

  private

  def set_tasks
    @category = Category.find(params[:category_id])
  end
end
