class Proof < ApplicationRecord
  has_many :project_proof
  has_many :projects, :through => :project_proof
end
