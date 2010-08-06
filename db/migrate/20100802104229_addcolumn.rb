class Addcolumn < ActiveRecord::Migration
  def self.up
    add_column :tasks, :member, :string
  end

  def self.down
    remove_column :tasks, :member, :string
  end
end
