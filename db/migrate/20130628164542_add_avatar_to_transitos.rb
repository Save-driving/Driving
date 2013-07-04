class AddAvatarToTransitos < ActiveRecord::Migration
  def self.up
    add_attachment :transitos, :avatar
  end

  def self.down
    remove_attachment :transitos, :avatar
  end
end
