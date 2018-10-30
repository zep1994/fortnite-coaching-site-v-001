class Meeting < ApplicationRecord
  has_many :user_meetings
  has_many :users, through: :user_meetings
  has_many :students
  #cannot edit or create meeting with belongs_to user

validates :name, :presence => true
validates :time, :presence => true
validates :type_player, :presence => true

default_scope { order(created_at: :desc) }
end
