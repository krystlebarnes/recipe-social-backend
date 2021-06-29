class Api::V1::RecipesController < ApplicationController
    before_action :set_recipe, only: [:show, :update, :destroy]


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

    def show
        render json: RecipeSerializer.new(@recipe)
    end

    def create
        @recipe = current_user.recipes.build(recipe_params)
        
        if @recipe.save
          render json RecipeSerializer.new(@recipe), status: :created
        else
          error_resp = {
          error: @recipe.error.full_messages.to_sentence
          }
          render json: error_resp, status: :unprocessable_entity
        end
    end

    def update
        if @recipe.update(recipe_params)
            render json:  RecipeSerializer.new(@recipe), status: :ok
        else
            error_resp = {
                error: @recipe.errors.full_messages.to_sentence
            }
            render json: error_resp, status: :unprocessable_entity
        end
    end

    def destroy
        if @recipe.destroy
            render json:  { data: "Recipe successfully deleted." }, status: :ok
        else
            error_resp = {
                error: "No recipe found to delete."
            }
            render json: error_resp, status: :unprocessable_entity
        end
    end

    private

    def set_recipe
        @recipe = Recipe.find(params[:id])
    end

    def recipe_params
        params.require(:recipe).permit(:name, :description, :prep_time, :cook_time, :serving_size, :calories, :author_id, ingredients_attributes: [:_destroy, :id, :quantity, :unit, :item_name, :notes], instructions_attributes: [:_destroy, :id, :step])
    end


end
