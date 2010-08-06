class Addcolumntouser < ActiveRecord::Migration
  def self.up
    add_column :users, :AdminId, :integer
  end

  def self.down
  remove_column :users, :AdminId, :integer
  end
end
