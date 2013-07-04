class Pais < ActiveRecord::Base

  attr_accessible :nombre, :sigla, :avatar

  has_many :departamentos

   validates :nombre, :presence => true,
  :length => {:minimum => 4, :maximum => 30 }

  validates :sigla, :presence => true,
  :length => {:minimum => 2, :maximum => 4 }

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
