class AddAvatarToGruas < ActiveRecord::Migration
  def self.up
    add_attachment :gruas, :avatar
  end

  def self.down
    remove_attachment :gruas, :avatar
  end
end
