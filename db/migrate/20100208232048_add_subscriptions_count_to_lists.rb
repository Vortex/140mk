class AddSubscriptionsCountToLists < ActiveRecord::Migration
  def self.up
    add_column :lists, :subscriptions_count, :integer, :default => 0

    List.reset_column_information

    List.all.each do |list|
      List.update_counters list.id, :subscriptions_count => list.subscriptions.length # size uses counter cache column
    end
  end

  def self.down
    remove_column :lists, :subscriptions_count
  end
end
