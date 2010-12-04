class Admin::PollsController < ApplicationController

  # Filters
  before_filter :require_admin

  # Layout
  layout 'admin'

  # Respond type
  respond_to :html

  # Inherited Resources
  inherit_resources


end
