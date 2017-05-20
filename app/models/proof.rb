class Proof < ApplicationRecord

  require 'rmagick'
  include Magick

  has_many :project_proof
  has_many :projects, :through => :project_proof


  def create_composite
    filename  = "#{store_dir}/composite" + ".jpg"
    composite = ImageList.new

    left  = Image.read( Rails.public_path.to_s + Photo.find( self.left_photo_id ).image.url(:thumb) ) if ! self.left_photo_id.nil?
    right = Image.read( Rails.public_path.to_s + Photo.find( self.right_photo_id ).image.url(:thumb) ) if ! self.right_photo_id.nil?

    composite.push( left.first ) if ! self.left_photo_id.nil?
    composite.push( right.first ) if ! self.right_photo_id.nil?

    composite.append(false).write(  Rails.public_path.to_s + filename );
    self.update( image: filename )
  end

  private

  def store_dir
    id_dir    = "/uploads/proof/image/#{self.id}"
    directory = Rails.public_path.to_s + id_dir

    Dir.mkdir(directory) if ! File.directory?(directory)

    id_dir
  end

end
