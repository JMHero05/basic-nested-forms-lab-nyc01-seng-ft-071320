class RecipesController < ApplicationController
  def show
    find_recipe
  end

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
    @recipe.ingredients.build(name: 'primary')
    @recipe.ingredients.build(name: 'secondary')
  end

  def create
    recipe = Recipe.create(recipe_params)
    redirect_to recipe_path(recipe)
  end

  private

  def find_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(
      :title,
      ingredients_attributes: [
      :name,
      :quantity
    ]
  )
  end
end
