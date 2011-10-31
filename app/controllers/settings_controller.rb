class SettingsController < ApplicationController
  before_filter :authenticate

  def index
    @selected_categories = current_user.categories.find(:all, :select => "categories.id, categories.name", :order => 'name ASC')
    @unselected_categories = Category.find(:all,
                                    :select => "categories.id, categories.name",
                                    :order => 'name ASC',
                                    :conditions => @selected_categories.empty? ? nil : ["categories.id NOT IN (?)", @selected_categories.map(&:id)])
  end
end
