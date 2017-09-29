class Movie < ActiveRecord::Base
    has_many :rate
    has_many :comment
    has_many :category
end
