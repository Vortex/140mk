class ConfigurationsController < InheritedResources::Base

  respond_to :js, :only => :update

end
