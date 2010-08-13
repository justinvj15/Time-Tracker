class Renamememberid < ActiveRecord::Migration
  def self.up
    rename_column :members,:member_id,:user_id
  end

  def self.down
  end
end
