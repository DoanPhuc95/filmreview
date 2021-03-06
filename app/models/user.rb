class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  mount_uploader :avatar, ImageUploader
  
  has_many :comments, dependent: :destroy
  has_many :rates, dependent: :destroy
   
  validates :name, presence: true
  validates :email, uniqueness: true, presence: true
  
  def is_admin?
    self.admin == true
  end
end
