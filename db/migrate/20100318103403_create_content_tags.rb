class CreateContentTags < ActiveRecord::Migration
  def self.up
    create_table :content_tags do |t|
			t.string :name, :null => false
			t.integer :order_index
			t.boolean :pagename
      t.timestamps
    end
  end

  def self.down
    drop_table :content_tags
  end
end
