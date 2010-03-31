class CreateContentTagBlocks < ActiveRecord::Migration
  def self.up
    create_table :content_tag_blocks do |t|
			t.integer :content_tag_id
			t.integer :content_block_id			
      t.timestamps
    end
  end

  def self.down
    drop_table :content_tag_blocks
  end
end
