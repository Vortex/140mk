class CreatePollQuestions < ActiveRecord::Migration
  def self.up
    create_table :poll_questions do |t|
      t.references :poll
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :poll_questions
  end
end
