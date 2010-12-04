class CreatePollChoices < ActiveRecord::Migration
  def self.up
    create_table :poll_choices do |t|
      t.references :poll_question
      t.string :name
      t.integer :poll_answers_count, :default => 0

      t.timestamps
    end
  end

  def self.down
    drop_table :poll_choices
  end
end
