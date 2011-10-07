require "spec_helper"

describe FilledFormsController do
  describe "routing" do

    it "routes to #index" do
      get("/filled_forms").should route_to("filled_forms#index")
    end

    it "routes to #new" do
      get("/filled_forms/new").should route_to("filled_forms#new")
    end

  end
end
