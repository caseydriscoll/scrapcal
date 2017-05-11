class Photo < ApplicationRecord
  belongs_to :user

  mount_uploader :image, ImageUploader
  validates_presence_of :image

  scope :by_month, lambda { |year, month| where('date >= ? and date <= ?', "#{year}-#{month}-01", "#{year}-#{month}-31") }

end
