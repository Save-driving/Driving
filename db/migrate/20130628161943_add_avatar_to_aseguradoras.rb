class AddAvatarToAseguradoras < ActiveRecord::Migration
  def self.up
    add_attachment :aseguradoras, :avatar
  end

  def self.down
    remove_attachment :aseguradoras, :avatar
  end
end
