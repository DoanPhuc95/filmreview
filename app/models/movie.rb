class Movie < ActiveRecord::Base
    has_many :rates
    has_many :comments
    has_many :categories
    has_many :actor_movies
    has_many :actors, through: :actor_movies
    
    belongs_to :producer
    
    mount_uploader :image, ImageUploader
    
    validates :name, presence: true
    validates :description, presence: true
    validates :producer, presence: true
    validates :image, presence: true
end
