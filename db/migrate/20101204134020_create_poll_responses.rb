class CreatePollResponses < ActiveRecord::Migration
  def self.up
    create_table :poll_responses do |t|
      t.references :user
      t.references :poll

      t.timestamps
    end
  end

  def self.down
    drop_table :poll_responses
  end
end
