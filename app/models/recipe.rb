class Recipe < ApplicationRecord
    belongs_to :author, :class_name => "User", :foreign_key => "author_id"
    has_many :comments
    has_many :likes
    has_many :ingredients
    has_many :instructions
    # has_many :users, :through => :comments
    # has_many :users, :through => :likes
end
