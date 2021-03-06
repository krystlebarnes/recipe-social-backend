class User < ApplicationRecord
    has_secure_password

    has_many :recipes, :foreign_key => "author_id"
    has_many :comments
    has_many :likes
    has_many :recipes, :through => :comments
    has_many :recipes, :through => :likes

    validates :name, :username, :presence => {:message => "can't be blank"}
    validates :username, :uniqueness => {:message => "is already in use" }
  
end
