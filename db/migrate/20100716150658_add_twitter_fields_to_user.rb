class AddTwitterFieldsToUser < ActiveRecord::Migration
  def self.up
		change_table :users do |t|
			t.string :twitter_name, :null => false, :default => true
			t.integer :twitter_id, :null => true, :default => nil, :length => 20
    end

  end

  def self.down
		change_table :users do |t|
			t.remove :twitter_name
			t.remove :twitter_id
    end
  end
end
