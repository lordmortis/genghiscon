class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
	    t.string    :login,               :null => true, :default => nil
	    t.string    :email,               :null => true, :default => nil
	    t.string    :crypted_password,    :null => false, :default => nil, :null => true
	    t.string    :password_salt,       :null => false, :default => nil, :null => true
	    t.string    :persistence_token,   :null => false
	    t.string    :single_access_token, :null => false
	    t.string    :perishable_token,    :null => false
			t.string		:openid_identifier,		:null => true

	    # Magic columns, just like ActiveRecord's created_at and updated_at. These are automatically maintained by Authlogic if they are present.
	    t.integer   :login_count,         :null => false, :default => 0 # optional, see Authlogic::Session::MagicColumns
	    t.integer   :failed_login_count,  :null => false, :default => 0 # optional, see Authlogic::Session::MagicColumns
	    t.datetime  :last_request_at                                    # optional, see Authlogic::Session::MagicColumns
	    t.datetime  :current_login_at                                   # optional, see Authlogic::Session::MagicColumns
	    t.datetime  :last_login_at                                      # optional, see Authlogic::Session::MagicColumns
	    t.string    :current_login_ip                                   # optional, see Authlogic::Session::MagicColumns
	    t.string    :last_login_ip                                      # optional, see Authlogic::Session::MagicColumns
      t.timestamps
    end

      add_index :users, :openid_identifier
      add_index :users, :login

  end

  def self.down
    drop_table :users
  end
end
