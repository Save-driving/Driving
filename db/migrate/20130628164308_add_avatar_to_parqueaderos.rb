class AddAvatarToParqueaderos < ActiveRecord::Migration
  def self.up
    add_attachment :parqueaderos, :avatar
  end

  def self.down
    remove_attachment :parqueaderos, :avatar
  end
end
