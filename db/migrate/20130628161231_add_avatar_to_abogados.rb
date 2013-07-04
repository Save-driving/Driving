class AddAvatarToAbogados < ActiveRecord::Migration
  def self.up
    add_attachment :abogados, :avatar
  end

  def self.down
    remove_attachment :abogados, :avatar
  end
end
