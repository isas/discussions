class AddLastAccessToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :last_access, :datetime, :default => 1.day.ago
  end

  def self.down
    remove_column :users, :last_access
  end
end
