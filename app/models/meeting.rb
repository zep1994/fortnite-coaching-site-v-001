class Meeting < ApplicationRecord
  has_many :students
  has_many :user_meetings
  has_many :users, through: :user_meetings
  belongs_to :user

validates :name, :presence => true
validates :time, :presence => true
validates :type_player, :presence => true
end
