class AddAvatarToCalificaciones < ActiveRecord::Migration
  def self.up
    add_attachment :calificaciones, :avatar
  end

  def self.down
    remove_attachment :calificaciones, :avatar
  end
end
