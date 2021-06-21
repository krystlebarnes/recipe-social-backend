class Api::V1::RecipesController < ApplicationController

    def index
        if params[:search]
          @recipes = Recipe.search(params[:search])
        elsif @author = User.find_by_id(params[:user_id])
          @recipes = @author.recipes
        else
          @recipes = Recipe.all
        end

        render json: RecipeSerializer.new(@recipes)
    end

end
