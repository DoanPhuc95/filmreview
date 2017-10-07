class CategoryController < ApplicationController
  before_action :find_category, only: :index
  
  def index
    @category = Category.where(value: @category_value).page(params[:page])
  end
  
  private
  def find_category
    @category_value = params[:value]
  end
end
