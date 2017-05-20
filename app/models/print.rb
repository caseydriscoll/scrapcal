class Print < ApplicationRecord
  has_many :project_print
  has_many :projects, :through => :project_print

  validates_presence_of :title

  attr_accessor :title

end
