class AddAvatarToConductores < ActiveRecord::Migration
  def self.up
    add_attachment :conductores, :avatar
  end

  def self.down
    remove_attachment :conductores, :avatar
  end
end
