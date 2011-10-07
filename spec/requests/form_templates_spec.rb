require 'spec_helper'

describe "FormTemplates" do
  describe "GET /form_templates" do
    it "returns success response" do
      visit form_templates_path
      response.status.should be(200)
    end
  end
end
