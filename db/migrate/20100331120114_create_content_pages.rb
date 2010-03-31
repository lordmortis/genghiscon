class CreateContentPages < ActiveRecord::Migration
  def self.up
    create_table :content_pages do |t|
			t.string :name, :null => false
      t.integer :content_block_id, :null => true
      t.integer :content_tag_id, :null => true
			t.integer :order_index
			t.boolean :home
			t.boolean :navbar
      t.timestamps
    end
  end
  
  def self.down
    drop_table :content_pages
  end
end
