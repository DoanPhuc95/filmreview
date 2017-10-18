class Category < ActiveRecord::Base
    belongs_to :movie
    
    validates :value, presence: true
    validates :value, presence: true, uniqueness: {scope: [:movie]}
end
