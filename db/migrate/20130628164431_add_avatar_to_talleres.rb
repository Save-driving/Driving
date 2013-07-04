class AddAvatarToTalleres < ActiveRecord::Migration
  def self.up
    add_attachment :talleres, :avatar
  end

  def self.down
    remove_attachment :talleres, :avatar
  end
end
