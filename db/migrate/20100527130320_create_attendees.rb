class CreateAttendees < ActiveRecord::Migration
  def self.up
    create_table :attendees do |t|
			t.integer :event_id
			t.string :name
			t.text :notes
			t.boolean :attended
			t.boolean :norsvp
			t.integer :user_id
      t.timestamps
    end
  end

  def self.down
    drop_table :attendees
  end
end
