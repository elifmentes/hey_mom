class TasksController < ApplicationController
  before_action :set_tasks

  def show
    @task = @tasks.find(params[:id])
  end

  private

  def set_tasks
    @category = Category.find(params[:category_id])

    if params[:query].present?
      @tasks = Task.where(category: @category, title: params[:query])
    else
      @tasks = Task.where(category: @category)
    end
  end
end
