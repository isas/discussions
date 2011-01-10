class AddFavorites < ActiveRecord::Migration
  def self.up
    create_table :favorites do |t|
      t.integer :rating
      t.integer :user_id
      t.integer :subject_id

      t.timestamps
    end
  end

  def self.down
    drop_table :favorites
  end
end
