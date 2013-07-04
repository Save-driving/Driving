class Transito < ActiveRecord::Base
  belongs_to :documento
  belongs_to :municipio
  belongs_to :calificacion
  attr_accessible :direccion, :email, :nombres, :numero_doc, :observaciones, :telefonos, :documento_nombre, :municipio_nombre, :calificacion_nombre
  attr_accessible :documento_id, :municipio_id, :calificacion_id, :avatar

  has_attached_file :avatar, :styles => { :small => "150x150>", :lsmall => "30x30>" },
                      :url  => "/assets/products/:id/:style/:basename.:extension",
                 :path => ":rails_root/public/assets/products/:id/:style/:basename.:extension"

  validates_attachment_presence :avatar
  validates_attachment_size :avatar, :less_than => 5.megabytes
  validates_attachment_content_type :avatar, :content_type => ['image/jpeg', 'image/png', 'image/jpg', 'image/gif']
  
  def self.search(search)
	   where('nombres like ?', "%#{search}%")
  end
end
