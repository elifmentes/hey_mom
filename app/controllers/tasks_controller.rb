class TasksController < ApplicationController
  before_action :find_category

  def index
    @tasks = Task.where(category: @category)
  end

  private

  def find_category
    @category = Category.find(params[:category_id])
  end
end
