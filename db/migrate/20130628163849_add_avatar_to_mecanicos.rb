class AddAvatarToMecanicos < ActiveRecord::Migration
  def self.up
    add_attachment :mecanicos, :avatar
  end

  def self.down
    remove_attachment :mecanicos, :avatar
  end
end
