class StepsController < ApplicationController
  before_action :find_task

  def index
    @steps = Step.where(task: @task)
  end

  def show
    find_step
  end

  private

  def find_task
    @task = Task.find(params[:task_id])
  end

  def find_step
    @step = Step.find(params[:id])
  end
end
