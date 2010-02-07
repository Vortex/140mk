class SettingsController < ApplicationController
  before_filter :authenticate

  def index
    @selected_lists = current_user.lists.find(:all, :select => "lists.id, lists.name", :order => 'name ASC')
    @not_selected_lists = List.find(:all, 
                                    :select => "lists.id, lists.name", 
                                    :order => 'name ASC', 
                                    :conditions => @selected_lists.empty? ? nil : ["lists.id NOT IN (?)", @selected_lists.map(&:id)])
  end
end
