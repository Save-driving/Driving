class Departamento < ActiveRecord::Base
  belongs_to :pais
  has_many :municipios
  attr_accessible :nombre, :sigla, :pais_nombre, :avatar

  validates :nombre, :presence => true,
  :length => { :maximum => 40 }

  validates :sigla, :presence => true,
  :length => { :maximum => 4 }

  validates :pais_nombre, :presence => true

   	def self.search(search)
    	where('nombre like ? ', "%#{search}%" )
  	end

  	def funky_method
  		"#{self.nombre}.camelize"
  	end

	def pais_nombre
		pais.nombre if pais
	end

	def pais_nombre=(nombre)
		self.pais = Pais.find_or_create_by_nombre(nombre) unless nombre.blank?
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
