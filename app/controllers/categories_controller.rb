class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])

    if params[:query].present?
      @tasks = Task.where(category: @category).search(params[:query])
    else
      @tasks = Task.where(category: @category)
    end
  end
end
