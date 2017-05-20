class Proof < ApplicationRecord

  require 'rmagick'
  include Magick

  has_many :project_proof
  has_many :projects, :through => :project_proof


  def create_composite
    composite = ImageList.new
    target    = Image.new( 880, 1200 ) { self.background_color = 'white' }
    stub      = Image.new( 20, 1200 ) { self.background_color = 'white' }

    left  = Image.read( Rails.public_path.to_s + Photo.find( self.left_photo_id ).image.url(:proof) ).first if ! self.left_photo_id.nil?
    right = Image.read( Rails.public_path.to_s + Photo.find( self.right_photo_id ).image.url(:proof) ).first if ! self.right_photo_id.nil?

    composite << stub.copy
    composite << target.composite( left, CenterGravity, AtopCompositeOp ) if ! self.left_photo_id.nil?

    if self.right_photo_id.nil?
      composite << target.copy
    else
      composite << target.composite( right, CenterGravity, CopyCompositeOp ) 
    end

    composite << stub.copy

    composite.append(false).write( Rails.public_path.to_s + "#{store_dir}/composite" + ".jpg" );
    composite.append(false).resize_to_fit( 300, 200 ).write( Rails.public_path.to_s + "#{store_dir}/thumb" + ".jpg" );
  end

  private

  def store_dir
    id_dir    = "/uploads/proof/image/#{self.id}"
    directory = Rails.public_path.to_s + id_dir

    Dir.mkdir(directory) if ! File.directory?(directory)

    id_dir
  end

end
