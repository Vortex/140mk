class AddSubscriptionsCountToLists < ActiveRecord::Migration
  def self.up
    add_column :lists, :subscriptions_count, :integer, :default => 0


  end

  def self.down
    remove_column :lists, :subscriptions_count
  end
end
