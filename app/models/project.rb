class Project < ApplicationRecord
  has_many :project_print
  has_many :prints, :through => :project_print

  validates_presence_of :title

end
