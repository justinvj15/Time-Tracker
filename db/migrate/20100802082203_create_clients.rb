class CreateClients < ActiveRecord::Migration
  def self.up
    create_table :clients do |t|
 t.column :name,               :string
t.column :description,              :text
t.column :user_id,              :integer
      t.timestamps
    end
  end

  def self.down
    drop_table :clients
  end
end
