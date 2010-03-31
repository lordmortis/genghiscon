class CreateContentBlocks < ActiveRecord::Migration
  def self.up
    create_table :content_blocks do |t|
			t.text :summary, :null => true
			t.text :bodytext, :null => true
			t.boolean :autosummarize, :null => false, :default => false
			t.integer :editor_id, :null => true
			t.integer :author_id, :null => true
      t.timestamps
    end

		add_index(:content_blocks, :author_id)
		add_index(:content_blocks, :editor_id)		
  end

  def self.down
    drop_table :content_blocks
  end
end
