class Movie < ActiveRecord::Base
    has_many :rates, dependent: :destroy
    has_many :comments, dependent: :destroy
    has_many :categories, dependent: :destroy
    has_many :actor_movies, dependent: :destroy
    has_many :actors, through: :actor_movies
    
    belongs_to :producer
    
    mount_uploader :image, ImageUploader
    
    validates :name, presence: true
    validates :description, presence: true
    validates :producer, presence: true
    validates :image, presence: true
end
