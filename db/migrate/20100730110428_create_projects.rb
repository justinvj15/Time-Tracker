class CreateProjects < ActiveRecord::Migration
  def self.up
    create_table :projects do |t|
 t.column :name,               :string
t.column :description,              :text
t.column :client_id,              :integer
t.column :user_id,              :integer
      t.timestamps
      t.timestamps
    end
  end

  def self.down
    drop_table :projects
  end
end
