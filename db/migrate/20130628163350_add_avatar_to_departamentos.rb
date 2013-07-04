class AddAvatarToDepartamentos < ActiveRecord::Migration
  def self.up
    add_attachment :departamentos, :avatar
  end

  def self.down
    remove_attachment :departamentos, :avatar
  end
end
