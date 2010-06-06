class AddSubscriptionsCountToLists < ActiveRecord::Migration
  def self.up
    add_column :lists, :subscriptions_count, :integer, :default => 0

    Category.reset_column_information

    Category.all.each do |list|
      Category.update_counters list.id, :subscriptions_count => list.subscriptions.length # size uses counter cache column
    end
  end

  def self.down
    remove_column :lists, :subscriptions_count
  end
end
