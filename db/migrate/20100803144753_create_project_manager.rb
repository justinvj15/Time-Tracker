class CreateProjectManager < ActiveRecord::Migration
  def self.up
     execute "INSERT INTO users (login,email, crypted_password, salt, created_at,updated_at, roles) VALUES ('admin','admin@timetrack.com','admin','admin','#{Time.now.to_s(:db)}','#{Time.now.to_s(:db)}','pm')"
  end

  def self.down
  end
end
