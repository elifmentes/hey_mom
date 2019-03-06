require 'pry-byebug'

class TasksController < ApplicationController
  before_action :set_tasks, only: [:show]

  def index
    if params[:query].present?
      @tasks = Task.search(params[:query])
    else
      @tasks = Task.all
    end
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
