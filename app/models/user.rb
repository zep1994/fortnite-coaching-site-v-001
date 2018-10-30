class User < ApplicationRecord
  has_many :user_meetings
  has_many :meetings, through: :user_meetings
  has_secure_password

  validates :name, :presence => true
  validates :name, :uniqueness => true
end
