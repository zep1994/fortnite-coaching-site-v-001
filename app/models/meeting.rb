class Meeting < ApplicationRecord
  has_many :students

validates :name, :presence => true
validates :time, :presence => true
validates :type_player, :presence => true

default_scope { order(created_at: :desc) }
end
