class Municipio < ActiveRecord::Base

  belongs_to :departamento
  
  attr_accessible :nombre, :departamento_nombre, :pais_nombre, :avatar

  validates :nombre, :presence => true,
  :length => {:minimum => 4, :maximum => 50 }

  validates :departamento_nombre, :presence => true


  def departamento_nombre
    departamento.nombre if departamento
  end

  def departamento_nombre=(nombre)
    self.departamento = Departamento.find_or_create_by_nombre(nombre) unless nombre.blank?
  end

  def self.muni_ubica(muni)
    @ubica = muni.nombre + ' | ' + muni.departamento.nombre + ' | ' + muni.departamento.pais.nombre
  end

  def funky_method
    "#{self.nombre}.camelize"
  end

  def self.search(search)
    where('nombre like ? ', "%#{search}%" )
  end

    has_attached_file :avatar, :styles => { :small => "150x150>", :lsmall => "30x30>" },
                      :url  => "/assets/products/:id/:style/:basename.:extension",
                 :path => ":rails_root/public/assets/products/:id/:style/:basename.:extension"

  validates_attachment_presence :avatar
  validates_attachment_size :avatar, :less_than => 5.megabytes
  validates_attachment_content_type :avatar, :content_type => ['image/jpeg', 'image/png', 'image/jpg', 'image/gif']
  
  def self.search(search)
     where('nombre like ?', "%#{search}%")
  end

end
