class Calificacion < ActiveRecord::Base

  has_many :talleres
  has_many :carrotalleres
  has_many :abogados
  has_many :conductores
  has_many :desplazamientos
  has_many :gruas
  has_many :mecanicos
  has_many :parqueaderos
  has_many :ambulancias
  has_many :aseguradoras
  has_many :bomberos
  has_many :transitos


  attr_accessible :nombre, :avatar

  has_attached_file :avatar, :styles => { :small => "150x150>", :lsmall => "30x30>" }
  

  validates :nombre, :presence => true,
  :length => { :maximum => 30 }

  validates_attachment_presence :avatar
  validates_attachment_size :avatar, :less_than => 5.megabytes
  validates_attachment_content_type :avatar, :content_type => ['image/jpeg', 'image/png', 'image/jpg', 'image/gif']

  def self.search(search)
	   where('nombre like ?', "%#{search}%")
  end
end
