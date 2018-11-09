class Student < ApplicationRecord
  belongs_to :meeting #Adds methods to Model.

  validates :name, :presence => true
end
