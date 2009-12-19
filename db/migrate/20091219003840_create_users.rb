class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :screen_name
      t.string :email
      t.string :atoken
      t.string :asecret

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
