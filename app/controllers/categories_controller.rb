class CategoriesController < ApplicationController
  def index
    @categories = Category.all
    @user = current_user
    @weather = Rails.configuration.open_weather_api.current lon: @user.longitude, lat: @user.latitude if user_signed_in?
  end

  def show
    if params[:query].present?
      @steps = Step.global_search(params[:query])
      @tasks = Task.where(steps: @steps)
    else
      @category = Category.find(params[:id])
      @tasks = Task.where(category: @category)
    end
  end
end
