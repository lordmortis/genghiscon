class CreateContentComments < ActiveRecord::Migration
  def self.up
    create_table :content_comments do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :content_comments
  end
end
