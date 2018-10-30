class Student < ApplicationRecord
  belongs_to :meeting #Adds methods to Model.
  belongs_to :user
  validates :name, :presence => true
end
