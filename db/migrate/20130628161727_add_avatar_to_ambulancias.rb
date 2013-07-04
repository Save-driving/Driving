class AddAvatarToAmbulancias < ActiveRecord::Migration
  def self.up
    add_attachment :ambulancias, :avatar
  end

  def self.down
    remove_attachment :ambulancias, :avatar
  end
end
