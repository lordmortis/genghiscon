class CreateRoles < ActiveRecord::Migration
  def self.up
    create_table :roles do |t|
			t.string :name
      t.timestamps
    end

		role = Role.new(:name => "executive")
		role.save

		role = Role.new(:name => "committee")
		role.save

		role = Role.new(:name => "member")
		role.save
  end

  def self.down
    drop_table :roles
  end
end
