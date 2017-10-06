class Movie < ActiveRecord::Base
    has_many :rate
    has_many :comment
    has_many :category
    has_many :actor_movie
    has_many :actor, through: :actor_movie
    
    validates :name, presence: true
    validates :description, presence: true
    validates :producer, presence: true
    validates :image, presence: true
end
