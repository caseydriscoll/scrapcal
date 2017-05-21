class Project < ApplicationRecord

  require 'zip'

  has_many :project_proof
  has_many :proofs, :through => :project_proof

  accepts_nested_attributes_for :proofs

  validates_presence_of :title


  def archive
    download = "/uploads/tmp/#{self.id}.zip"
    proofs   = self.proofs.select(:id)
    files    = proofs.map { |proof| Rails.public_path.to_s + "/uploads/proof/image/#{proof.id}/composite.jpg" }

    @zip = Zip::File.open(Rails.public_path.to_s + download, Zip::File::CREATE) do |zipfile|
      files.each_with_index do |filename,index|
        # Two arguments:
        # - The name of the file as it will appear in the archive
        # - The original file, including the path to find it
        zipfile.add( "photo.#{index}.jpg", filename ) if zipfile.find_entry("photo.#{index}.jpg").nil?
      end
      # zipfile.get_output_stream("myFile") { |os| os.write "myFile contains just this" }
    end

    @archive = { success: true, zip: download }
  end


  def generate
    photos = Photo.all.order( 'date ASC' )

    photos += [Photo.new] if photos.count.odd?

    photos.each_with_index do |photo, index|
      if index.odd?
        even = photos[index - 1]
        proof = self.proofs.create(
                      title:          "Proof #{even.id}-#{photo.id}",
                      left_photo_id:  even.id,
                      right_photo_id: photo.id
                    )
        proof.create_composite
      end
    end

  end

end
