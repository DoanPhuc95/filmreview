class Category < ActiveRecord::Base
    belongs_to :movie
    
    validates :value, presence: true
end
