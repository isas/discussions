class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :user_name
      t.string :password
      t.string :full_name
      t.string :email
      t.string :twitter_name
      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
