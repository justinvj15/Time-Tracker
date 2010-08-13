class Addtimetotasks < ActiveRecord::Migration
  def self.up
     add_column :tasks, :time, :time
  end

  def self.down
    add_column :tasks, :time, :time
  end
end
