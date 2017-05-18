class Project < ApplicationRecord
  has_many :project_print
  has_many :prints, :through => :project_print

  accepts_nested_attributes_for :prints

  validates_presence_of :title

end
