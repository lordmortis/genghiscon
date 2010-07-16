class AddPreviewToBlocks < ActiveRecord::Migration
  def self.up
		change_table :content_blocks do |t|
			t.boolean :preview, :null => false, :default => true
    end
  end

  def self.down
		change_table :content_blocks do |t|
			t.remove :preview
    end
  end
end
