class ActorMovie < ActiveRecord::Base
  belongs_to :movie
  belongs_to :actor
  
  validates :actor, presence: true, uniqueness: {scope: [:movie]}
  validates :movie, presence: true
end
