class CreateContentImages < ActiveRecord::Migration
  def self.up
    create_table :content_images do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :content_images
  end
end
