class Admin::WelcomeController < ApplicationController

  # Filters
  before_filter :require_admin

  # Layout
  layout 'admin'

  def index
  end
end
