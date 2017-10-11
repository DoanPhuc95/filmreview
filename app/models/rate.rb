class Rate < ActiveRecord::Base
    belongs_to :user
    belongs_to :movie
    
    validates :user, presence: true, uniqueness: {scope: [:movie]}
    validates :movie, presence: true
end
