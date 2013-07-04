class AddAvatarToMunicipios < ActiveRecord::Migration
  def self.up
    add_attachment :municipios, :avatar
  end

  def self.down
    remove_attachment :municipios, :avatar
  end
end
