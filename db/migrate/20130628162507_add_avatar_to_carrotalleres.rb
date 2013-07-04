class AddAvatarToCarrotalleres < ActiveRecord::Migration
  def self.up
    add_attachment :carrotalleres, :avatar
  end

  def self.down
    remove_attachment :carrotalleres, :avatar
  end
end
