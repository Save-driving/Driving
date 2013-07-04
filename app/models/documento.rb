class Documento < ActiveRecord::Base
  attr_accessible :nombre, :sigla
  has_many :informaciones

  validates :nombre, :presence => true,
  :length => { :maximum => 15 }

  validates :sigla, :presence => true,
  :length => { :maximum => 4 }

end
