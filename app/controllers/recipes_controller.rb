class RecipesController < ApplicationController

	before_action :find_recipe, only: [:show, :update, :edit, :destroy]
	def index
		@recipes = Recipe.all.sorted
	end

	def show
	end

	def new
		@recipe = Recipe.new
	end

	def create
		@recipe = Recipe.new(recipe_params)

		if @recipe.save
			redirect_to @recipe, notice: "Successfully created a new recipe"
		else
			render 'new'
		end
	end

	def edit
	end

	def update

		if @recipe.update(recipe_params) 

			redirect_to @recipe, notice: "Successfully updated #{@recipe.title}"
		else
			render 'edit'
		end

	end

	def destroy
		@recipe.destroy
		redirect_to root_path, notice: "Successfully deleted #{@recipe.title}"
	end

	private

	def find_recipe
		@recipe = Recipe.find(params[:id])
	end

	def recipe_params
		params.require(:recipe).permit(:title, :description)
	end
end
