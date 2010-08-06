class CreateTasks < ActiveRecord::Migration
  def self.up
    create_table :tasks do |t|
      t.column :name,               :string
t.column :description,              :text
t.column :duration,              :integer
t.column :project_id,              :integer
t.column :user_id,              :integer
      t.timestamps
    end
  end

  def self.down
    drop_table :tasks
  end
end
