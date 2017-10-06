class CategoryController < ApplicationController
  before_action :find_category, only: :index
  
  def index
  end
  
  private
  def find_category
    @category_value = params[:value]
    @category = Category.where value: @category_value
  end
end
