class AddAvatarToBomberos < ActiveRecord::Migration
  def self.up
    add_attachment :bomberos, :avatar
  end

  def self.down
    remove_attachment :bomberos, :avatar
  end
end
