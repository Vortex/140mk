require File.dirname(__FILE__) + '/../spec_helper'

describe TagsController do

  it "displays index action" do
    get :index
    response.should be_success
  end

end
