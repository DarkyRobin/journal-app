class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def new
    @category = Category.new
  end

  def create
    @category = current_user.categories.new(category_params)
  
    if @category.save
      redirect_to categories_path, success: 'Category was successfully created.'
    else
      flash.now[:danger] = 'Name and description cannot be empty.'
      render :new
    end
  end

  def edit
  end

  def update
    if @category.update(category_params)
      redirect_to categories_path, success: 'Category was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @category = Category.find(params[:id])
    if @category.destroy
      flash[:success] = 'Category was successfully deleted.'
      redirect_to categories_path
    else
      flash[:danger] = 'Unable to delete category.'
      redirect_to categories_path
    end
    rescue ActiveRecord::InvalidForeignKey
      flash[:danger] = 'Cannot delete category with associated records.'
      redirect_to categories_path
  end

  def show
  end

  private

  def category_params
    params.require(:category).permit(:name, :description)
  end

  def set_category
    @category = Category.find(params[:id])
  end
end
