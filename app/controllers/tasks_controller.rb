class TasksController < ApplicationController
  before_action :set_tasks

  def index
  end

  def show
    @task = @tasks.find(params[:id])
    @steps = @task.steps
  end

  private

  def set_tasks
    @category = Category.find(params[:category_id])
    @tasks = Task.where(category: @category)
  end
end
