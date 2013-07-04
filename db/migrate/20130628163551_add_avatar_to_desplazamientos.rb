class AddAvatarToDesplazamientos < ActiveRecord::Migration
  def self.up
    add_attachment :desplazamientos, :avatar
  end

  def self.down
    remove_attachment :desplazamientos, :avatar
  end
end
