class Print < ApplicationRecord
  has_many :projectprints
  has_many :projects, :through => :course_students
end
