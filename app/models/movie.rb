class Movie < ActiveRecord::Base
    has_many :rate
    has_many :comment
    has_many :category
    
    validates :name, presence: true
    validates :description, presence: true
    validates :producer, presence: true
    validates :image, presence: true
end
