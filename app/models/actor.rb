class Actor < ActiveRecord::Base
    has_many :actor_movie
    has_many :movie, through: :actor_movie
    
    validates :name, uniqueness: true
end
