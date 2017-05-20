class Proof < ApplicationRecord
  has_many :project_print
  has_many :projects, :through => :project_print
end
