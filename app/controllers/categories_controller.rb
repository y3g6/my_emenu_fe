class CategoriesController < ApplicationController
  before_action :load_category, only: [:show, :edit, :update, :destory]

  def index
    @categories = Category.all
  end

  def show
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_param)
    if @category.save
      redirect_to category_path(@category.id)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @category.update(category_param)
      redirect_to category_path(@category.id)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    load_category
    @category.destroy
    redirect_to categories_path
  end

  private
    def load_category
      @category = Category.find params[:id]
    end

    def category_param
      params.require(:category).permit(:name, :id)
    end
end
