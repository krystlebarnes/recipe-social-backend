class RecipeSerializer
    include FastJsonapi::ObjectSerializer
    attributes :name, :description, :prep_time, :cook_time, :serving_size, :calories
    has_many :ingredients
    has_many :instructions
    
end