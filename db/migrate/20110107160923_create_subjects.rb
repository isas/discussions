class CreateSubjects < ActiveRecord::Migration
  def self.up
    create_table :subjects do |t|
      t.string :type
      t.string :title
      t.text :description
      t.string :director
      t.string :year
      t.string :genre
      t.string :origin
      t.string :music_type
      t.string :author
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :subjects
  end
end
