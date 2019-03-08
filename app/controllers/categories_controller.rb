class CategoriesController < ApplicationController
  def index
    @categories = Category.all
    @user = current_user
    @weather = Rails.configuration.open_weather_api.current city: @user.location if user_signed_in?
  end

  def show
    @category = Category.find(params[:id])
    @tasks = Task.where(category: @category)
  end
end
