class Producer < ActiveRecord::Base
    has_many :movies, dependent: :nullify
    
    validates :name, uniqueness: true
end
