class AddOauthFields < ActiveRecord::Migration
  def self.up
    add_column :users, :active_token_id, :integer
		add_column :users, :twitter_id, :integer, :null => true, :default => nil, :length => 20
		add_column :users, :facebook_id, :integer, :null => true, :default => nil, :length => 64 

    create_table :sessions do |t|
      t.string :session_id, :null => false
      t.text :data
      t.timestamps
    end

    add_index :sessions, :session_id
    add_index :sessions, :updated_at

    create_table :access_tokens do |t|
      t.integer :user_id
      t.string :type, :limit => 30
      t.string :key # how we identify the user, in case they logout and log back in
      t.string :token, :limit => 1024 # This has to be huge because of Yahoo's excessively large tokens
      t.string :secret
      t.boolean :active # whether or not it's associated with the account
      t.timestamps
    end
    
    add_index :access_tokens, :key, :unique
  end

  def self.down
		remove_column :users, :active_token_id
		remove_column :users, :twitter_id
		remove_column :users, :facebook_id

		drop_table :sessions		

    drop_table :access_tokens

    [:login, :crypted_password, :password_salt].each do |field|
      User.all(:conditions => "#{field} is NULL").each { |user| user.update_attribute(field, "") if user.send(field).nil? }
      change_column :users, field, :string, :default => "", :null => false
    end
  end
end
