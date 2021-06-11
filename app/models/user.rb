class User < ApplicationRecord
    has_secure_password

    has_many :recipes, :foreign_key => "author_id"
end
