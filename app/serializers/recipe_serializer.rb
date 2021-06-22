class RecipeSerializer
    include FastJsonapi::ObjectSerializer
    attributes :name, :image_url, :description, :prep_time, :cook_time, :serving_size, :calories
    
    attribute :ingredients do |recipe|
        recipe.ingredients.map do |ingredient|
          {
            quantity: ingredient.quantity,
            unit: ingredient.unit,
            item: ingredient.item,
            notes: ingredient.notes
          }
        end
    end
    
    attribute :instructions do |recipe|
        recipe.instructions.map do |instruction|
          {
            step: instruction.step
          }
        end
    end

end