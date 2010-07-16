class AddPublishToContentBlocks < ActiveRecord::Migration
  def self.up
		change_table :content_blocks do |t|
			t.boolean :published, :null => false, :default => false
			t.integer :tweet_id, :null => true, :default => nil, :length => 20
			t.string :short_url, :null => true, :default => nil
    end

		for block in ContentBlock.all
			block.published = true
			block.save
		end
  end

  def self.down
		change_table :content_blocks do |t|
			t.remove :published
			t.remove :tweet_id
			t.remove :short_url			
    end
  end
end