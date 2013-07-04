class AddAvatarToPaises < ActiveRecord::Migration
  def self.up
    add_attachment :paises, :avatar
  end

  def self.down
    remove_attachment :paises, :avatar
  end
end
