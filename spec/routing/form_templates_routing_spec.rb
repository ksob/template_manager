require "spec_helper"

describe FormTemplatesController do
  describe "routing" do

    it "routes to #index" do
      get("/form_templates").should route_to("form_templates#index")
    end

    it "routes to #show" do
      get("/form_templates/1").should route_to("form_templates#show", :id => "1")
    end

  end
end
