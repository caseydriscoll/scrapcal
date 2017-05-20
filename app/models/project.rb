class Project < ApplicationRecord
  has_many :project_proof
  has_many :proofs, :through => :project_proof

  accepts_nested_attributes_for :proofs

  validates_presence_of :title


  def generate
    photos = Photo.all

    photos += [Photo.new] if photos.count.odd?

    photos.each_with_index do |photo, index|
      if index.odd?
        even = photos[index - 1]
        self.proofs.create(
                      title:          "Proof #{even.id}-#{photo.id}",
                      left_photo_id:  even.id,
                      right_photo_id: photo.id
                    )

      end
    end

  end

end
