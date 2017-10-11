class Producer < ActiveRecord::Base
    has_many :movie
    
    validates :name, uniqueness: true
end
